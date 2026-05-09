; DESCRIPTION: Composite: Renders a red disk with center (287, 177) and radius 78 then Draws a green line from (450, 231) to (60, 211).
; PLAN: r0=287(x), r1=177(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x1), r6=231(y1), r7=60(x2), r8=211(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 177
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 231
LDI r7, 60
LDI r8, 211
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
