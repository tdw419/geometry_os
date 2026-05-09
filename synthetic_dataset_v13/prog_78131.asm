; DESCRIPTION: Composite: Places a yellow line segment connecting (290, 172) to (17, 144) then Places a green circle of radius 45 at center (342, 59).
; PLAN: r0=290(x1), r1=172(y1), r2=17(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=342(x), r6=59(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 290
LDI r1, 172
LDI r2, 17
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 342
LDI r6, 59
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
