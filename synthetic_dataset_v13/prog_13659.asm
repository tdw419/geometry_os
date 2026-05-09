; DESCRIPTION: Composite: Renders a yellow disk with center (313, 73) and radius 48 then Places a black line segment connecting (134, 248) to (4, 165) then Sets a single yellow pixel at (360, 199).
; PLAN: r0=313(x), r1=73(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=134(x1), r6=248(y1), r7=4(x2), r8=165(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=360(x), r11=199(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 313
LDI r1, 73
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 134
LDI r6, 248
LDI r7, 4
LDI r8, 165
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 360
LDI r11, 199
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
