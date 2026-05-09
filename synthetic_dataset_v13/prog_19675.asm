; DESCRIPTION: Creates a purple rectangular region at (91, 40) spanning 52 by 22 pixels.
; PLAN: r0=91(x), r1=40(y), r2=52(width), r3=22(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 40
LDI r2, 52
LDI r3, 22
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
