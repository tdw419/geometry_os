; DESCRIPTION: Composite: Draws a yellow line from (390, 107) to (479, 15) then Creates a white rectangular region at (433, 144) spanning 19 by 68 pixels then Places a red dot at position (426, 112).
; PLAN: r0=390(x1), r1=107(y1), r2=479(x2), r3=15(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=433(x), r6=144(y), r7=19(width), r8=68(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=426(x), r11=112(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 107
LDI r2, 479
LDI r3, 15
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 433
LDI r6, 144
LDI r7, 19
LDI r8, 68
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 426
LDI r11, 112
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
