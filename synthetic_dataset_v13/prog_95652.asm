; DESCRIPTION: Creates a purple rectangular region at (293, 99) spanning 37 by 100 pixels.
; PLAN: r0=293(x), r1=99(y), r2=37(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 99
LDI r2, 37
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
