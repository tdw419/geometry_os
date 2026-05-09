; DESCRIPTION: Renders a purple line between points (66, 243) and (352, 254).
; PLAN: r0=66(x1), r1=243(y1), r2=352(x2), r3=254(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 243
LDI r2, 352
LDI r3, 254
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
