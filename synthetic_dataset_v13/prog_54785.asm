; DESCRIPTION: Creates a purple rectangular region at (110, 33) spanning 10 by 40 pixels.
; PLAN: r0=110(x), r1=33(y), r2=10(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 33
LDI r2, 10
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
