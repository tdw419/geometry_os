; DESCRIPTION: Creates a purple rectangular region at (258, 162) spanning 12 by 51 pixels.
; PLAN: r0=258(x), r1=162(y), r2=12(width), r3=51(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 162
LDI r2, 12
LDI r3, 51
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
