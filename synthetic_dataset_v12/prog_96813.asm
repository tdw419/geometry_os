; DESCRIPTION: Composite: Places a white circle of radius 63 at center (249, 137) then Draws a magenta line from (10, 178) to (505, 51) then Places a white dot at position (395, 49).
; PLAN: r0=249(x), r1=137(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=10(x1), r6=178(y1), r7=505(x2), r8=51(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=395(x), r11=49(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 249
LDI r1, 137
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 10
LDI r6, 178
LDI r7, 505
LDI r8, 51
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 395
LDI r11, 49
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
