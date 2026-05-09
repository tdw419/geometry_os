; DESCRIPTION: Composite: Creates a yellow circular shape at (120, 147) with radius 61 then Renders a cyan line between points (176, 143) and (114, 62) then Draws a cyan rectangle at (229, 62) with width 85 and height 75.
; PLAN: r0=120(x), r1=147(y), r2=61(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=176(x1), r6=143(y1), r7=114(x2), r8=62(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=229(x), r11=62(y), r12=85(width), r13=75(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 120
LDI r1, 147
LDI r2, 61
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 176
LDI r6, 143
LDI r7, 114
LDI r8, 62
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 229
LDI r11, 62
LDI r12, 85
LDI r13, 75
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
