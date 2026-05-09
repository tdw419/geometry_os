; DESCRIPTION: Composite: Places a blue circle of radius 20 at center (276, 90) then Places a yellow line segment connecting (192, 64) to (66, 245).
; PLAN: r0=276(x), r1=90(y), r2=20(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x1), r6=64(y1), r7=66(x2), r8=245(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 276
LDI r1, 90
LDI r2, 20
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 64
LDI r7, 66
LDI r8, 245
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
