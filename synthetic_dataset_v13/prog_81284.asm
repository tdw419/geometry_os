; DESCRIPTION: Renders a purple box of size 52x20 starting at (391, 205).
; PLAN: r0=391(x), r1=205(y), r2=52(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 391
LDI r1, 205
LDI r2, 52
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
