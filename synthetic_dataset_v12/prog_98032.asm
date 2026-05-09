; DESCRIPTION: Composite: Renders a blue line between points (164, 104) and (255, 192) then Renders a magenta disk with center (264, 172) and radius 31.
; PLAN: r0=164(x1), r1=104(y1), r2=255(x2), r3=192(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=264(x), r6=172(y), r7=31(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 164
LDI r1, 104
LDI r2, 255
LDI r3, 192
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 264
LDI r6, 172
LDI r7, 31
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
