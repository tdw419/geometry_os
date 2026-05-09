; DESCRIPTION: Composite: Draws a black circle centered at (371, 99) with radius 37 then Places a red line segment connecting (274, 135) to (264, 231).
; PLAN: r0=371(x), r1=99(y), r2=37(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x1), r6=135(y1), r7=264(x2), r8=231(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 99
LDI r2, 37
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 135
LDI r7, 264
LDI r8, 231
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
