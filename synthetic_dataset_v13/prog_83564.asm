; DESCRIPTION: Composite: Creates a black circular shape at (439, 74) with radius 26 then Draws a cyan line from (425, 158) to (349, 63) then Creates a yellow rectangular region at (238, 128) spanning 77 by 117 pixels.
; PLAN: r0=439(x), r1=74(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=425(x1), r6=158(y1), r7=349(x2), r8=63(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=238(x), r11=128(y), r12=77(width), r13=117(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 439
LDI r1, 74
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 425
LDI r6, 158
LDI r7, 349
LDI r8, 63
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 238
LDI r11, 128
LDI r12, 77
LDI r13, 117
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
