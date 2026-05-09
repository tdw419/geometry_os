; DESCRIPTION: Renders a purple line between points (213, 50) and (433, 193).
; PLAN: r0=213(x1), r1=50(y1), r2=433(x2), r3=193(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 50
LDI r2, 433
LDI r3, 193
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
