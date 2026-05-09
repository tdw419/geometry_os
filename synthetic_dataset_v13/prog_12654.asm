; DESCRIPTION: Composite: Draws a white rectangle at (326, 50) with width 13 and height 19 then Sets a single red pixel at (468, 103) then Places a red line segment connecting (283, 89) to (26, 128).
; PLAN: r0=326(x), r1=50(y), r2=13(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=468(x), r6=103(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=283(x1), r11=89(y1), r12=26(x2), r13=128(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 50
LDI r2, 13
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 468
LDI r6, 103
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 283
LDI r11, 89
LDI r12, 26
LDI r13, 128
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
