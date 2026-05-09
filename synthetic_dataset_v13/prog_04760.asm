; DESCRIPTION: Renders a purple box of size 68x49 starting at (331, 62).
; PLAN: r0=331(x), r1=62(y), r2=68(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 62
LDI r2, 68
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
