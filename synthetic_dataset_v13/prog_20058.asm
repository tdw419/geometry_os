; DESCRIPTION: Composite: Renders a yellow box of size 17x87 starting at (75, 136) then Renders a orange line between points (143, 77) and (486, 103) then Places a black dot at position (156, 60).
; PLAN: r0=75(x), r1=136(y), r2=17(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x1), r6=77(y1), r7=486(x2), r8=103(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=60(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 136
LDI r2, 17
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 77
LDI r7, 486
LDI r8, 103
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 60
LDI r12, 0x000000
PSET r10, r11, r12
HALT
