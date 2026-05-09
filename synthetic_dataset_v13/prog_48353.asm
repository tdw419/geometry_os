; DESCRIPTION: Composite: Draws a blue circle centered at (248, 129) with radius 80 then Draws a green line from (192, 80) to (27, 17).
; PLAN: r0=248(x), r1=129(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=80(y1), r7=27(x2), r8=17(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 248
LDI r1, 129
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 80
LDI r7, 27
LDI r8, 17
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
