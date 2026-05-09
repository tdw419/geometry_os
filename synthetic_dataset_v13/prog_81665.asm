; DESCRIPTION: Renders a purple box of size 105x13 starting at (23, 86).
; PLAN: r0=23(x), r1=86(y), r2=105(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 86
LDI r2, 105
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
