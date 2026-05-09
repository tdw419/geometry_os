; DESCRIPTION: Composite: Places a black line segment connecting (456, 147) to (318, 139) then Draws a yellow rectangle at (274, 66) with width 60 and height 90 then Places a red dot at position (385, 171).
; PLAN: r0=456(x1), r1=147(y1), r2=318(x2), r3=139(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=66(y), r7=60(width), r8=90(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=385(x), r11=171(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 147
LDI r2, 318
LDI r3, 139
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 66
LDI r7, 60
LDI r8, 90
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 385
LDI r11, 171
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
