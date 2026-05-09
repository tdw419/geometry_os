; DESCRIPTION: Composite: Renders a black line between points (204, 150) and (242, 12) then Sets a single blue pixel at (35, 5) then Draws a red circle centered at (443, 79) with radius 69.
; PLAN: r0=204(x1), r1=150(y1), r2=242(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=5(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=443(x), r11=79(y), r12=69(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 204
LDI r1, 150
LDI r2, 242
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 5
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 443
LDI r11, 79
LDI r12, 69
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
