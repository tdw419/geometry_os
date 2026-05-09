; DESCRIPTION: Composite: Places a purple 63x81 rectangle at position (46, 111) then Renders a orange line between points (314, 243) and (486, 11) then Places a black dot at position (308, 218).
; PLAN: r0=46(x), r1=111(y), r2=63(width), r3=81(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=314(x1), r6=243(y1), r7=486(x2), r8=11(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=218(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 46
LDI r1, 111
LDI r2, 63
LDI r3, 81
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 314
LDI r6, 243
LDI r7, 486
LDI r8, 11
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 218
LDI r12, 0x000000
PSET r10, r11, r12
HALT
