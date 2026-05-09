; DESCRIPTION: Composite: Creates a white rectangular region at (229, 168) spanning 68 by 78 pixels then Renders a green disk with center (143, 169) and radius 74 then Draws a yellow line from (43, 221) to (255, 249).
; PLAN: r0=229(x), r1=168(y), r2=68(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=169(y), r7=74(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x1), r11=221(y1), r12=255(x2), r13=249(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 229
LDI r1, 168
LDI r2, 68
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 169
LDI r7, 74
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 221
LDI r12, 255
LDI r13, 249
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
