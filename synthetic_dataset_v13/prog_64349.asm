; DESCRIPTION: Composite: Draws a white rectangle at (351, 40) with width 70 and height 82 then Renders a black line between points (233, 106) and (389, 136) then Places a cyan dot at position (296, 146).
; PLAN: r0=351(x), r1=40(y), r2=70(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=233(x1), r6=106(y1), r7=389(x2), r8=136(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=296(x), r11=146(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 351
LDI r1, 40
LDI r2, 70
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 233
LDI r6, 106
LDI r7, 389
LDI r8, 136
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 146
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
