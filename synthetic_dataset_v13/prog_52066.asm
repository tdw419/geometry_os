; DESCRIPTION: Composite: Renders a black line between points (130, 38) and (255, 12) then Creates a yellow circular shape at (254, 190) with radius 12 then Places a blue dot at position (251, 155).
; PLAN: r0=130(x1), r1=38(y1), r2=255(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=254(x), r6=190(y), r7=12(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=155(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 38
LDI r2, 255
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 190
LDI r7, 12
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 155
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
