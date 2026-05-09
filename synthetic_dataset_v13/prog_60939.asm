; DESCRIPTION: Composite: Creates a orange circular shape at (441, 89) with radius 47 then Draws a red line from (370, 14) to (446, 163) then Places a green dot at position (2, 254).
; PLAN: r0=441(x), r1=89(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=370(x1), r6=14(y1), r7=446(x2), r8=163(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=2(x), r11=254(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 441
LDI r1, 89
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 370
LDI r6, 14
LDI r7, 446
LDI r8, 163
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 2
LDI r11, 254
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
