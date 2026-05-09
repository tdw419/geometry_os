; DESCRIPTION: Composite: Draws a black circle centered at (210, 79) with radius 29 then Renders a blue line between points (194, 68) and (43, 202) then Places a black dot at position (347, 46).
; PLAN: r0=210(x), r1=79(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=194(x1), r6=68(y1), r7=43(x2), r8=202(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=347(x), r11=46(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 79
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 194
LDI r6, 68
LDI r7, 43
LDI r8, 202
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 347
LDI r11, 46
LDI r12, 0x000000
PSET r10, r11, r12
HALT
