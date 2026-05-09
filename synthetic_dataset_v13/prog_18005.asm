; DESCRIPTION: Creates a yellow rectangular region at (293, 45) spanning 119 by 84 pixels.
; PLAN: r0=293(x), r1=45(y), r2=119(width), r3=84(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 45
LDI r2, 119
LDI r3, 84
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
