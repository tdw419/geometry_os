; DESCRIPTION: Composite: Draws a green line from (178, 221) to (327, 232) then Draws a purple rectangle at (470, 81) with width 25 and height 100 then Sets a single red pixel at (497, 75).
; PLAN: r0=178(x1), r1=221(y1), r2=327(x2), r3=232(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=470(x), r6=81(y), r7=25(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=497(x), r11=75(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 221
LDI r2, 327
LDI r3, 232
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 470
LDI r6, 81
LDI r7, 25
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 497
LDI r11, 75
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
