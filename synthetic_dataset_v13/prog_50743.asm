; DESCRIPTION: Composite: Places a orange dot at position (193, 89) then Renders a cyan line between points (147, 86) and (306, 56) then Creates a cyan rectangular region at (75, 121) spanning 95 by 37 pixels.
; PLAN: r0=193(x), r1=89(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=147(x1), r6=86(y1), r7=306(x2), r8=56(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=75(x), r11=121(y), r12=95(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 193
LDI r1, 89
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 147
LDI r6, 86
LDI r7, 306
LDI r8, 56
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 121
LDI r12, 95
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
