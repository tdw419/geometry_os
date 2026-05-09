; DESCRIPTION: Composite: Places a yellow line segment connecting (330, 208) to (230, 208) then Draws a red circle centered at (359, 159) with radius 48.
; PLAN: r0=330(x1), r1=208(y1), r2=230(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=359(x), r6=159(y), r7=48(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 208
LDI r2, 230
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 359
LDI r6, 159
LDI r7, 48
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
