; DESCRIPTION: Creates a purple rectangular region at (99, 114) spanning 52 by 54 pixels.
; PLAN: r0=99(x), r1=114(y), r2=52(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 114
LDI r2, 52
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
