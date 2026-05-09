; DESCRIPTION: Composite: Sets a single orange pixel at (88, 121) then Renders a magenta line between points (347, 180) and (22, 177) then Places a white circle of radius 75 at center (295, 136).
; PLAN: r0=88(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=347(x1), r6=180(y1), r7=22(x2), r8=177(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=295(x), r11=136(y), r12=75(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 88
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 347
LDI r6, 180
LDI r7, 22
LDI r8, 177
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 295
LDI r11, 136
LDI r12, 75
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
