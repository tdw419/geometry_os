; DESCRIPTION: Renders a green line between points (338, 149) and (190, 197).
; PLAN: r0=338(x1), r1=149(y1), r2=190(x2), r3=197(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 149
LDI r2, 190
LDI r3, 197
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
