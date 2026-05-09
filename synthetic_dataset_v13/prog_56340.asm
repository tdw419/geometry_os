; DESCRIPTION: Creates a orange rectangular region at (201, 60) spanning 18 by 51 pixels.
; PLAN: r0=201(x), r1=60(y), r2=18(width), r3=51(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 60
LDI r2, 18
LDI r3, 51
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
