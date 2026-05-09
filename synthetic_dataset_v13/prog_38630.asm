; DESCRIPTION: Composite: Renders a purple line between points (259, 231) and (438, 243) then Places a purple circle of radius 70 at center (301, 119).
; PLAN: r0=259(x1), r1=231(y1), r2=438(x2), r3=243(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=301(x), r6=119(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 259
LDI r1, 231
LDI r2, 438
LDI r3, 243
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 119
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
