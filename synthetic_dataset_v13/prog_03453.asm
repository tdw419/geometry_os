; DESCRIPTION: Composite: Draws a blue circle centered at (239, 144) with radius 77 then Places a yellow line segment connecting (274, 192) to (360, 178).
; PLAN: r0=239(x), r1=144(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=192(y1), r7=360(x2), r8=178(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 144
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 192
LDI r7, 360
LDI r8, 178
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
