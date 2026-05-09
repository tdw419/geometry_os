; DESCRIPTION: Composite: Places a red 26x110 rectangle at position (276, 105) then Places a white dot at position (452, 127) then Draws a black line from (171, 241) to (242, 70).
; PLAN: r0=276(x), r1=105(y), r2=26(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=127(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=171(x1), r11=241(y1), r12=242(x2), r13=70(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 276
LDI r1, 105
LDI r2, 26
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 127
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 171
LDI r11, 241
LDI r12, 242
LDI r13, 70
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
