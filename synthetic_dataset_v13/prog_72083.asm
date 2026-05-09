; DESCRIPTION: Composite: Places a red 83x81 rectangle at position (40, 56) then Renders a black line between points (40, 184) and (24, 18) then Sets a single orange pixel at (215, 107).
; PLAN: r0=40(x), r1=56(y), r2=83(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=40(x1), r6=184(y1), r7=24(x2), r8=18(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=107(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 40
LDI r1, 56
LDI r2, 83
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 184
LDI r7, 24
LDI r8, 18
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 107
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
