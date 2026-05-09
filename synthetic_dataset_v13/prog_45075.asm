; DESCRIPTION: Composite: Places a magenta circle of radius 31 at center (371, 43) then Places a green line segment connecting (14, 196) to (229, 104).
; PLAN: r0=371(x), r1=43(y), r2=31(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=196(y1), r7=229(x2), r8=104(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 371
LDI r1, 43
LDI r2, 31
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 196
LDI r7, 229
LDI r8, 104
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
