; DESCRIPTION: Renders a purple line between points (157, 51) and (402, 213).
; PLAN: r0=157(x1), r1=51(y1), r2=402(x2), r3=213(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 51
LDI r2, 402
LDI r3, 213
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
