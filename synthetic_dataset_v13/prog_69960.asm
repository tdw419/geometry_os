; DESCRIPTION: Creates a magenta rectangular region at (222, 6) spanning 28 by 112 pixels.
; PLAN: r0=222(x), r1=6(y), r2=28(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 6
LDI r2, 28
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
