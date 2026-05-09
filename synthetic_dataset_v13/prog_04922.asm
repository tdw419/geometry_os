; DESCRIPTION: Composite: Renders a white line between points (489, 94) and (474, 78) then Draws a green rectangle at (282, 82) with width 87 and height 115 then Places a blue dot at position (454, 104).
; PLAN: r0=489(x1), r1=94(y1), r2=474(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=282(x), r6=82(y), r7=87(width), r8=115(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=454(x), r11=104(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 489
LDI r1, 94
LDI r2, 474
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 282
LDI r6, 82
LDI r7, 87
LDI r8, 115
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 104
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
