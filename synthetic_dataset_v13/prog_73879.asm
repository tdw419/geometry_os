; DESCRIPTION: Renders a purple box of size 62x97 starting at (416, 123).
; PLAN: r0=416(x), r1=123(y), r2=62(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 123
LDI r2, 62
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
