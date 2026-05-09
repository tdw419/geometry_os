; DESCRIPTION: Composite: Renders a black line between points (479, 89) and (264, 244) then Draws a purple rectangle at (272, 93) with width 42 and height 72 then Renders a orange disk with center (167, 176) and radius 77.
; PLAN: r0=479(x1), r1=89(y1), r2=264(x2), r3=244(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=272(x), r6=93(y), r7=42(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=167(x), r11=176(y), r12=77(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 479
LDI r1, 89
LDI r2, 264
LDI r3, 244
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 272
LDI r6, 93
LDI r7, 42
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 176
LDI r12, 77
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
