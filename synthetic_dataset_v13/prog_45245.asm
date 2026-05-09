; DESCRIPTION: Composite: Places a green circle of radius 25 at center (453, 190) then Renders a red line between points (393, 206) and (493, 94).
; PLAN: r0=453(x), r1=190(y), r2=25(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=393(x1), r6=206(y1), r7=493(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 190
LDI r2, 25
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 393
LDI r6, 206
LDI r7, 493
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
