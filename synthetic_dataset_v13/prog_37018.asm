; DESCRIPTION: Composite: Sets a single orange pixel at (20, 14) then Draws a cyan line from (101, 7) to (453, 132) then Draws a orange circle centered at (97, 160) with radius 51.
; PLAN: r0=20(x), r1=14(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=101(x1), r6=7(y1), r7=453(x2), r8=132(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=97(x), r11=160(y), r12=51(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 20
LDI r1, 14
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 101
LDI r6, 7
LDI r7, 453
LDI r8, 132
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 160
LDI r12, 51
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
