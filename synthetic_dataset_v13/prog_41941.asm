; DESCRIPTION: Composite: Places a red circle of radius 80 at center (328, 109) then Creates a black rectangular region at (401, 21) spanning 49 by 44 pixels then Draws a green line from (296, 97) to (7, 180).
; PLAN: r0=328(x), r1=109(y), r2=80(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=21(y), r7=49(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=296(x1), r11=97(y1), r12=7(x2), r13=180(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 109
LDI r2, 80
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 21
LDI r7, 49
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 296
LDI r11, 97
LDI r12, 7
LDI r13, 180
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
