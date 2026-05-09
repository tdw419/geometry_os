; DESCRIPTION: Composite: Renders a white line between points (310, 24) and (158, 241) then Draws a red rectangle at (326, 118) with width 57 and height 65 then Places a black dot at position (308, 187).
; PLAN: r0=310(x1), r1=24(y1), r2=158(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=118(y), r7=57(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=308(x), r11=187(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 24
LDI r2, 158
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 118
LDI r7, 57
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 187
LDI r12, 0x000000
PSET r10, r11, r12
HALT
