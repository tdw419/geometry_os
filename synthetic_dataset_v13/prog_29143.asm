; DESCRIPTION: Composite: Renders a yellow line between points (297, 43) and (328, 202) then Draws a yellow rectangle at (164, 0) with width 10 and height 24 then Sets a single blue pixel at (13, 78).
; PLAN: r0=297(x1), r1=43(y1), r2=328(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=0(y), r7=10(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=13(x), r11=78(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 297
LDI r1, 43
LDI r2, 328
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 0
LDI r7, 10
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 13
LDI r11, 78
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
