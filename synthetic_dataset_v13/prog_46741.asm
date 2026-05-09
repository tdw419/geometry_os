; DESCRIPTION: Composite: Places a cyan line segment connecting (374, 82) to (40, 163) then Draws a black rectangle at (334, 175) with width 99 and height 54 then Sets a single black pixel at (411, 173).
; PLAN: r0=374(x1), r1=82(y1), r2=40(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=175(y), r7=99(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=411(x), r11=173(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 374
LDI r1, 82
LDI r2, 40
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 175
LDI r7, 99
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 173
LDI r12, 0x000000
PSET r10, r11, r12
HALT
