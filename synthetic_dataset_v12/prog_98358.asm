; DESCRIPTION: Composite: Places a green dot at position (307, 240) then Renders a black line between points (338, 237) and (84, 55) then Draws a yellow circle centered at (310, 50) with radius 38.
; PLAN: r0=307(x), r1=240(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=338(x1), r6=237(y1), r7=84(x2), r8=55(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=50(y), r12=38(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 307
LDI r1, 240
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 338
LDI r6, 237
LDI r7, 84
LDI r8, 55
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 50
LDI r12, 38
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
