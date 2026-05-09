; DESCRIPTION: Composite: Places a red line segment connecting (152, 31) to (8, 98) then Draws a purple rectangle at (261, 147) with width 103 and height 25 then Places a white dot at position (288, 193).
; PLAN: r0=152(x1), r1=31(y1), r2=8(x2), r3=98(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=147(y), r7=103(width), r8=25(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=193(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 31
LDI r2, 8
LDI r3, 98
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 147
LDI r7, 103
LDI r8, 25
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 193
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
