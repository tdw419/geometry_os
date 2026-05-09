; DESCRIPTION: Composite: Renders a black line between points (176, 225) and (450, 20) then Draws a white circle centered at (401, 136) with radius 65 then Sets a single red pixel at (253, 3).
; PLAN: r0=176(x1), r1=225(y1), r2=450(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=401(x), r6=136(y), r7=65(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=253(x), r11=3(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 176
LDI r1, 225
LDI r2, 450
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 136
LDI r7, 65
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 253
LDI r11, 3
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
