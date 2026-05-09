; DESCRIPTION: Composite: Renders a purple line between points (181, 9) and (444, 250) then Creates a yellow rectangular region at (193, 111) spanning 111 by 41 pixels then Sets a single cyan pixel at (410, 229).
; PLAN: r0=181(x1), r1=9(y1), r2=444(x2), r3=250(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=111(y), r7=111(width), r8=41(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=410(x), r11=229(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 181
LDI r1, 9
LDI r2, 444
LDI r3, 250
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 111
LDI r7, 111
LDI r8, 41
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 229
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
