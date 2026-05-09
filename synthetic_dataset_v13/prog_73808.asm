; DESCRIPTION: Composite: Renders a orange line between points (258, 61) and (95, 251) then Places a black 115x65 rectangle at position (245, 110) then Places a green dot at position (388, 210).
; PLAN: r0=258(x1), r1=61(y1), r2=95(x2), r3=251(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=245(x), r6=110(y), r7=115(width), r8=65(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=388(x), r11=210(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 258
LDI r1, 61
LDI r2, 95
LDI r3, 251
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 110
LDI r7, 115
LDI r8, 65
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 210
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
