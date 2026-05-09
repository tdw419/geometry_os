; DESCRIPTION: Composite: Places a orange dot at position (61, 240) then Renders a blue line between points (178, 28) and (506, 18) then Draws a white circle centered at (67, 150) with radius 36.
; PLAN: r0=61(x), r1=240(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=178(x1), r6=28(y1), r7=506(x2), r8=18(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=67(x), r11=150(y), r12=36(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 61
LDI r1, 240
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 178
LDI r6, 28
LDI r7, 506
LDI r8, 18
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 67
LDI r11, 150
LDI r12, 36
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
