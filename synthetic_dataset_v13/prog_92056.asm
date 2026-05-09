; DESCRIPTION: Composite: Renders a cyan line between points (197, 21) and (497, 85) then Creates a cyan rectangular region at (129, 89) spanning 26 by 103 pixels then Places a green dot at position (207, 200).
; PLAN: r0=197(x1), r1=21(y1), r2=497(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=129(x), r6=89(y), r7=26(width), r8=103(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=200(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 21
LDI r2, 497
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 89
LDI r7, 26
LDI r8, 103
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 200
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
