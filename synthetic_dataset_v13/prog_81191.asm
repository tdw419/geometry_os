; DESCRIPTION: Composite: Places a green circle of radius 10 at center (215, 145) then Renders a white line between points (296, 236) and (231, 70).
; PLAN: r0=215(x), r1=145(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=296(x1), r6=236(y1), r7=231(x2), r8=70(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 215
LDI r1, 145
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 296
LDI r6, 236
LDI r7, 231
LDI r8, 70
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
