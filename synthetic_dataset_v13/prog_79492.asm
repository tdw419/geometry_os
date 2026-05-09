; DESCRIPTION: Composite: Places a magenta line segment connecting (57, 104) to (123, 176) then Renders a green disk with center (453, 83) and radius 49.
; PLAN: r0=57(x1), r1=104(y1), r2=123(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=453(x), r6=83(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 57
LDI r1, 104
LDI r2, 123
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 453
LDI r6, 83
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
