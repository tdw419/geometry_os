; DESCRIPTION: Composite: Sets a single red pixel at (505, 196) then Draws a white rectangle at (427, 87) with width 42 and height 11 then Draws a yellow line from (317, 135) to (358, 244).
; PLAN: r0=505(x), r1=196(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=427(x), r6=87(y), r7=42(width), r8=11(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=317(x1), r11=135(y1), r12=358(x2), r13=244(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 196
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 427
LDI r6, 87
LDI r7, 42
LDI r8, 11
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 317
LDI r11, 135
LDI r12, 358
LDI r13, 244
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
