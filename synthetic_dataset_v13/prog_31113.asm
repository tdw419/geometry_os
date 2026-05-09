; DESCRIPTION: Composite: Creates a white rectangular region at (252, 8) spanning 95 by 13 pixels then Places a black circle of radius 11 at center (99, 233) then Draws a green line from (466, 208) to (31, 223).
; PLAN: r0=252(x), r1=8(y), r2=95(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=99(x), r6=233(y), r7=11(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=466(x1), r11=208(y1), r12=31(x2), r13=223(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 252
LDI r1, 8
LDI r2, 95
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 99
LDI r6, 233
LDI r7, 11
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 466
LDI r11, 208
LDI r12, 31
LDI r13, 223
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
