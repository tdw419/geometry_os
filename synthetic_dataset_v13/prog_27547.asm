; DESCRIPTION: Creates a magenta rectangular region at (398, 15) spanning 23 by 112 pixels.
; PLAN: r0=398(x), r1=15(y), r2=23(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 15
LDI r2, 23
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
