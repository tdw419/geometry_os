; DESCRIPTION: Composite: Sets a single yellow pixel at (175, 240) then Places a blue line segment connecting (500, 120) to (480, 209) then Renders a blue disk with center (223, 105) and radius 76.
; PLAN: r0=175(x), r1=240(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=120(y1), r7=480(x2), r8=209(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=223(x), r11=105(y), r12=76(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 175
LDI r1, 240
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 500
LDI r6, 120
LDI r7, 480
LDI r8, 209
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 223
LDI r11, 105
LDI r12, 76
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
