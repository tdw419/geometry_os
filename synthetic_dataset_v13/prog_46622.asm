; DESCRIPTION: Creates a purple rectangular region at (288, 162) spanning 18 by 35 pixels.
; PLAN: r0=288(x), r1=162(y), r2=18(width), r3=35(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 162
LDI r2, 18
LDI r3, 35
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
