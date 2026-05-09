; DESCRIPTION: Composite: Places a black circle of radius 12 at center (273, 204) then Draws a blue line from (63, 187) to (264, 15).
; PLAN: r0=273(x), r1=204(y), r2=12(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=63(x1), r6=187(y1), r7=264(x2), r8=15(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 273
LDI r1, 204
LDI r2, 12
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 63
LDI r6, 187
LDI r7, 264
LDI r8, 15
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
