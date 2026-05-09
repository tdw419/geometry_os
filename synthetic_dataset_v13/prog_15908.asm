; DESCRIPTION: Composite: Draws a magenta rectangle at (143, 188) with width 23 and height 14 then Places a white dot at position (136, 233) then Places a black line segment connecting (503, 52) to (94, 75).
; PLAN: r0=143(x), r1=188(y), r2=23(width), r3=14(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=136(x), r6=233(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=503(x1), r11=52(y1), r12=94(x2), r13=75(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 188
LDI r2, 23
LDI r3, 14
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 136
LDI r6, 233
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 503
LDI r11, 52
LDI r12, 94
LDI r13, 75
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
