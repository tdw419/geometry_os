; DESCRIPTION: Creates a purple rectangular region at (110, 2) spanning 18 by 103 pixels.
; PLAN: r0=110(x), r1=2(y), r2=18(width), r3=103(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 2
LDI r2, 18
LDI r3, 103
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
