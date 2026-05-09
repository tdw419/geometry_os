; DESCRIPTION: Composite: Places a red line segment connecting (476, 189) to (174, 125) then Draws a white rectangle at (326, 52) with width 105 and height 109 then Sets a single orange pixel at (135, 223).
; PLAN: r0=476(x1), r1=189(y1), r2=174(x2), r3=125(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=52(y), r7=105(width), r8=109(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=135(x), r11=223(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 476
LDI r1, 189
LDI r2, 174
LDI r3, 125
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 52
LDI r7, 105
LDI r8, 109
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 135
LDI r11, 223
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
