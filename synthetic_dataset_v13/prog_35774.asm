; DESCRIPTION: Composite: Draws a cyan rectangle at (38, 48) with width 76 and height 105 then Draws a purple line from (50, 49) to (197, 195) then Places a magenta dot at position (369, 136).
; PLAN: r0=38(x), r1=48(y), r2=76(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x1), r6=49(y1), r7=197(x2), r8=195(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=369(x), r11=136(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 38
LDI r1, 48
LDI r2, 76
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 49
LDI r7, 197
LDI r8, 195
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 369
LDI r11, 136
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
