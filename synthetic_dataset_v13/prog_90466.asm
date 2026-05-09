; DESCRIPTION: Composite: Draws a magenta rectangle at (403, 204) with width 107 and height 10 then Draws a green circle centered at (86, 123) with radius 66 then Renders a red line between points (388, 0) and (262, 150).
; PLAN: r0=403(x), r1=204(y), r2=107(width), r3=10(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=123(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=388(x1), r11=0(y1), r12=262(x2), r13=150(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 204
LDI r2, 107
LDI r3, 10
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 123
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 388
LDI r11, 0
LDI r12, 262
LDI r13, 150
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
