; DESCRIPTION: Composite: Creates a orange rectangular region at (289, 15) spanning 27 by 89 pixels then Renders a yellow line between points (293, 3) and (408, 121) then Sets a single red pixel at (72, 216).
; PLAN: r0=289(x), r1=15(y), r2=27(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=293(x1), r6=3(y1), r7=408(x2), r8=121(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=72(x), r11=216(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 15
LDI r2, 27
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 3
LDI r7, 408
LDI r8, 121
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 216
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
