; DESCRIPTION: Composite: Sets a single red pixel at (239, 211) then Renders a blue line between points (458, 136) and (454, 2) then Draws a magenta circle centered at (258, 173) with radius 55.
; PLAN: r0=239(x), r1=211(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=458(x1), r6=136(y1), r7=454(x2), r8=2(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=258(x), r11=173(y), r12=55(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 239
LDI r1, 211
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 458
LDI r6, 136
LDI r7, 454
LDI r8, 2
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 258
LDI r11, 173
LDI r12, 55
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
