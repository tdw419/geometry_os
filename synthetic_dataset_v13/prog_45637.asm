; DESCRIPTION: Creates a magenta rectangular region at (72, 18) spanning 72 by 112 pixels.
; PLAN: r0=72(x), r1=18(y), r2=72(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 18
LDI r2, 72
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
