; DESCRIPTION: Composite: Places a green line segment connecting (418, 147) to (143, 3) then Places a red dot at position (492, 186) then Draws a white rectangle at (344, 218) with width 81 and height 21.
; PLAN: r0=418(x1), r1=147(y1), r2=143(x2), r3=3(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=186(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=344(x), r11=218(y), r12=81(width), r13=21(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 147
LDI r2, 143
LDI r3, 3
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 186
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 344
LDI r11, 218
LDI r12, 81
LDI r13, 21
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
