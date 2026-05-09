; DESCRIPTION: Composite: Draws a yellow rectangle at (355, 103) with width 61 and height 76 then Renders a magenta disk with center (373, 80) and radius 57 then Renders a green line between points (229, 253) and (247, 173).
; PLAN: r0=355(x), r1=103(y), r2=61(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=373(x), r6=80(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=229(x1), r11=253(y1), r12=247(x2), r13=173(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 103
LDI r2, 61
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 80
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 229
LDI r11, 253
LDI r12, 247
LDI r13, 173
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
