; DESCRIPTION: Creates a purple rectangular region at (496, 45) spanning 10 by 69 pixels.
; PLAN: r0=496(x), r1=45(y), r2=10(width), r3=69(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 496
LDI r1, 45
LDI r2, 10
LDI r3, 69
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
