; DESCRIPTION: Composite: Draws a green circle centered at (404, 97) with radius 66 then Places a black line segment connecting (490, 220) to (281, 202).
; PLAN: r0=404(x), r1=97(y), r2=66(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=490(x1), r6=220(y1), r7=281(x2), r8=202(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 97
LDI r2, 66
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 490
LDI r6, 220
LDI r7, 281
LDI r8, 202
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
