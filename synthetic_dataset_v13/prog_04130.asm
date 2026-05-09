; DESCRIPTION: Composite: Draws a yellow line from (384, 169) to (150, 183) then Places a white circle of radius 75 at center (186, 93) then Creates a blue rectangular region at (24, 62) spanning 61 by 54 pixels.
; PLAN: r0=384(x1), r1=169(y1), r2=150(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=93(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=62(y), r12=61(width), r13=54(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 169
LDI r2, 150
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 93
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 62
LDI r12, 61
LDI r13, 54
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
