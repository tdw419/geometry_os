; DESCRIPTION: Composite: Renders a red line between points (446, 73) and (448, 147) then Places a yellow 83x72 rectangle at position (153, 170) then Places a orange dot at position (420, 223).
; PLAN: r0=446(x1), r1=73(y1), r2=448(x2), r3=147(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=170(y), r7=83(width), r8=72(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=420(x), r11=223(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 446
LDI r1, 73
LDI r2, 448
LDI r3, 147
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 170
LDI r7, 83
LDI r8, 72
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 420
LDI r11, 223
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
