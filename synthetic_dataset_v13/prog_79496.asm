; DESCRIPTION: Composite: Places a green dot at position (62, 184) then Places a green 94x98 rectangle at position (89, 82) then Renders a orange line between points (104, 86) and (427, 3).
; PLAN: r0=62(x), r1=184(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=89(x), r6=82(y), r7=94(width), r8=98(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=104(x1), r11=86(y1), r12=427(x2), r13=3(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 184
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 89
LDI r6, 82
LDI r7, 94
LDI r8, 98
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 104
LDI r11, 86
LDI r12, 427
LDI r13, 3
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
