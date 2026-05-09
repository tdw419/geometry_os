; DESCRIPTION: Composite: Places a blue circle of radius 69 at center (204, 94) then Renders a yellow line between points (338, 127) and (231, 40).
; PLAN: r0=204(x), r1=94(y), r2=69(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=127(y1), r7=231(x2), r8=40(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 94
LDI r2, 69
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 127
LDI r7, 231
LDI r8, 40
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
