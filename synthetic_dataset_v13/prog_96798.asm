; DESCRIPTION: Renders a yellow line between points (433, 195) and (190, 80).
; PLAN: r0=433(x1), r1=195(y1), r2=190(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 195
LDI r2, 190
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
