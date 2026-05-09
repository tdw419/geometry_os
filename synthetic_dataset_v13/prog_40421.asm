; DESCRIPTION: Composite: Draws a yellow line from (173, 128) to (4, 57) then Creates a yellow rectangular region at (296, 52) spanning 103 by 43 pixels then Sets a single red pixel at (386, 75).
; PLAN: r0=173(x1), r1=128(y1), r2=4(x2), r3=57(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=296(x), r6=52(y), r7=103(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=75(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 173
LDI r1, 128
LDI r2, 4
LDI r3, 57
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 296
LDI r6, 52
LDI r7, 103
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 75
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
