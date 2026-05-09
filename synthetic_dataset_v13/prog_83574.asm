; DESCRIPTION: Renders a purple box of size 101x14 starting at (350, 176).
; PLAN: r0=350(x), r1=176(y), r2=101(width), r3=14(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 176
LDI r2, 101
LDI r3, 14
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
