; DESCRIPTION: Composite: Renders a red line between points (250, 113) and (296, 239) then Draws a blue circle centered at (302, 144) with radius 69 then Places a blue dot at position (312, 1).
; PLAN: r0=250(x1), r1=113(y1), r2=296(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=302(x), r6=144(y), r7=69(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=312(x), r11=1(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 250
LDI r1, 113
LDI r2, 296
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 302
LDI r6, 144
LDI r7, 69
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 312
LDI r11, 1
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
