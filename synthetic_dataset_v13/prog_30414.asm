; DESCRIPTION: Composite: Places a cyan dot at position (20, 178) then Places a orange line segment connecting (80, 92) to (181, 153) then Draws a cyan circle centered at (265, 145) with radius 71.
; PLAN: r0=20(x), r1=178(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=92(y1), r7=181(x2), r8=153(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=265(x), r11=145(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 178
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 92
LDI r7, 181
LDI r8, 153
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 265
LDI r11, 145
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
