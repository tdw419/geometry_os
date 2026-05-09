; DESCRIPTION: Renders a purple line between points (449, 134) and (75, 213).
; PLAN: r0=449(x1), r1=134(y1), r2=75(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 134
LDI r2, 75
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
