; DESCRIPTION: Creates a purple rectangular region at (123, 162) spanning 19 by 40 pixels.
; PLAN: r0=123(x), r1=162(y), r2=19(width), r3=40(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 162
LDI r2, 19
LDI r3, 40
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
