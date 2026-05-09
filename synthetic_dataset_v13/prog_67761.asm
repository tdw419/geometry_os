; DESCRIPTION: Composite: Renders a green line between points (392, 233) and (362, 57) then Draws a orange rectangle at (334, 122) with width 105 and height 42 then Sets a single black pixel at (38, 179).
; PLAN: r0=392(x1), r1=233(y1), r2=362(x2), r3=57(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=122(y), r7=105(width), r8=42(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=38(x), r11=179(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 392
LDI r1, 233
LDI r2, 362
LDI r3, 57
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 122
LDI r7, 105
LDI r8, 42
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 38
LDI r11, 179
LDI r12, 0x000000
PSET r10, r11, r12
HALT
