; DESCRIPTION: Renders a purple box of size 65x13 starting at (115, 86).
; PLAN: r0=115(x), r1=86(y), r2=65(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 86
LDI r2, 65
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
