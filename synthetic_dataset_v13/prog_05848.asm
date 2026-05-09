; DESCRIPTION: Renders a purple box of size 13x14 starting at (142, 176).
; PLAN: r0=142(x), r1=176(y), r2=13(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 176
LDI r2, 13
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
