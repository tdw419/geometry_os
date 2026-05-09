; DESCRIPTION: Composite: Renders a green line between points (323, 52) and (361, 27) then Creates a black rectangular region at (262, 104) spanning 107 by 115 pixels then Sets a single red pixel at (245, 149).
; PLAN: r0=323(x1), r1=52(y1), r2=361(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=104(y), r7=107(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=149(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 323
LDI r1, 52
LDI r2, 361
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 104
LDI r7, 107
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 149
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
