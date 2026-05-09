; DESCRIPTION: Composite: Draws a cyan line from (231, 159) to (477, 38) then Renders a blue disk with center (220, 119) and radius 80.
; PLAN: r0=231(x1), r1=159(y1), r2=477(x2), r3=38(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=220(x), r6=119(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 159
LDI r2, 477
LDI r3, 38
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 220
LDI r6, 119
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
