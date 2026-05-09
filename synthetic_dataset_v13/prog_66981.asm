; DESCRIPTION: Composite: Places a black dot at position (503, 137) then Renders a white line between points (167, 60) and (394, 119) then Draws a cyan circle centered at (369, 159) with radius 69.
; PLAN: r0=503(x), r1=137(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=167(x1), r6=60(y1), r7=394(x2), r8=119(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=159(y), r12=69(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 137
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 167
LDI r6, 60
LDI r7, 394
LDI r8, 119
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 159
LDI r12, 69
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
