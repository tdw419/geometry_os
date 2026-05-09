; DESCRIPTION: Composite: Renders a cyan line between points (486, 251) and (110, 5) then Draws a red rectangle at (231, 80) with width 105 and height 40 then Sets a single yellow pixel at (257, 95).
; PLAN: r0=486(x1), r1=251(y1), r2=110(x2), r3=5(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=231(x), r6=80(y), r7=105(width), r8=40(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=257(x), r11=95(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 486
LDI r1, 251
LDI r2, 110
LDI r3, 5
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 80
LDI r7, 105
LDI r8, 40
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 257
LDI r11, 95
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
