; DESCRIPTION: Creates a magenta rectangular region at (227, 45) spanning 117 by 56 pixels.
; PLAN: r0=227(x), r1=45(y), r2=117(width), r3=56(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 45
LDI r2, 117
LDI r3, 56
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
