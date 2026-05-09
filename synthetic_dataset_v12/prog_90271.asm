; DESCRIPTION: Renders a purple box of size 57x20 starting at (37, 126).
; PLAN: r0=37(x), r1=126(y), r2=57(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 126
LDI r2, 57
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
