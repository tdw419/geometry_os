; DESCRIPTION: Renders a purple line between points (433, 149) and (363, 134).
; PLAN: r0=433(x1), r1=149(y1), r2=363(x2), r3=134(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 149
LDI r2, 363
LDI r3, 134
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
