; DESCRIPTION: Composite: Sets a single cyan pixel at (138, 132) then Renders a blue box of size 104x65 starting at (10, 5) then Draws a orange line from (363, 169) to (0, 2).
; PLAN: r0=138(x), r1=132(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=5(y), r7=104(width), r8=65(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=363(x1), r11=169(y1), r12=0(x2), r13=2(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 138
LDI r1, 132
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 5
LDI r7, 104
LDI r8, 65
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 363
LDI r11, 169
LDI r12, 0
LDI r13, 2
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
