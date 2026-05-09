; DESCRIPTION: Composite: Renders a cyan line between points (475, 185) and (192, 51) then Draws a red rectangle at (82, 185) with width 32 and height 54 then Sets a single black pixel at (369, 187).
; PLAN: r0=475(x1), r1=185(y1), r2=192(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=185(y), r7=32(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=369(x), r11=187(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 185
LDI r2, 192
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 185
LDI r7, 32
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 187
LDI r12, 0x000000
PSET r10, r11, r12
HALT
