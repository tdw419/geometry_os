; DESCRIPTION: Creates a magenta rectangular region at (162, 130) spanning 84 by 56 pixels.
; PLAN: r0=162(x), r1=130(y), r2=84(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 130
LDI r2, 84
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
