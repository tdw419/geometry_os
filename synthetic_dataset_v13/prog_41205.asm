; DESCRIPTION: Composite: Draws a green circle centered at (424, 62) with radius 26 then Draws a red rectangle at (39, 93) with width 93 and height 34 then Renders a cyan line between points (236, 147) and (379, 106).
; PLAN: r0=424(x), r1=62(y), r2=26(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x), r6=93(y), r7=93(width), r8=34(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x1), r11=147(y1), r12=379(x2), r13=106(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 424
LDI r1, 62
LDI r2, 26
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 93
LDI r7, 93
LDI r8, 34
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 147
LDI r12, 379
LDI r13, 106
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
