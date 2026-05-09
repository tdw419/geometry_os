; DESCRIPTION: Composite: Creates a red circular shape at (459, 97) with radius 48 then Renders a yellow line between points (431, 30) and (185, 115).
; PLAN: r0=459(x), r1=97(y), r2=48(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=30(y1), r7=185(x2), r8=115(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 459
LDI r1, 97
LDI r2, 48
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 30
LDI r7, 185
LDI r8, 115
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
