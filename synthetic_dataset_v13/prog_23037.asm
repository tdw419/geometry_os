; DESCRIPTION: Renders a purple box of size 85x13 starting at (332, 32).
; PLAN: r0=332(x), r1=32(y), r2=85(width), r3=13(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 32
LDI r2, 85
LDI r3, 13
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
