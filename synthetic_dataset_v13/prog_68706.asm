; DESCRIPTION: Composite: Sets a single cyan pixel at (499, 12) then Renders a black line between points (221, 214) and (142, 162) then Draws a green circle centered at (377, 45) with radius 45.
; PLAN: r0=499(x), r1=12(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=221(x1), r6=214(y1), r7=142(x2), r8=162(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=377(x), r11=45(y), r12=45(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 499
LDI r1, 12
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 214
LDI r7, 142
LDI r8, 162
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 377
LDI r11, 45
LDI r12, 45
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
