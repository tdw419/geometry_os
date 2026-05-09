; DESCRIPTION: Composite: Sets a single magenta pixel at (265, 43) then Renders a black line between points (370, 247) and (104, 230) then Draws a yellow circle centered at (103, 96) with radius 73.
; PLAN: r0=265(x), r1=43(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=247(y1), r7=104(x2), r8=230(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=103(x), r11=96(y), r12=73(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 265
LDI r1, 43
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 247
LDI r7, 104
LDI r8, 230
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 103
LDI r11, 96
LDI r12, 73
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
