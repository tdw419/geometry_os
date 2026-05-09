; DESCRIPTION: Composite: Places a green line segment connecting (312, 28) to (429, 22) then Places a green 107x120 rectangle at position (276, 13) then Creates a black circular shape at (305, 136) with radius 72.
; PLAN: r0=312(x1), r1=28(y1), r2=429(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=13(y), r7=107(width), r8=120(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=305(x), r11=136(y), r12=72(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 312
LDI r1, 28
LDI r2, 429
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 13
LDI r7, 107
LDI r8, 120
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 136
LDI r12, 72
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
