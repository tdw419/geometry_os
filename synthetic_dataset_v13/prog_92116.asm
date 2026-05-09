; DESCRIPTION: Composite: Renders a magenta disk with center (69, 163) and radius 60 then Renders a white line between points (145, 56) and (400, 233) then Draws a magenta rectangle at (62, 26) with width 61 and height 120.
; PLAN: r0=69(x), r1=163(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=145(x1), r6=56(y1), r7=400(x2), r8=233(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=62(x), r11=26(y), r12=61(width), r13=120(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 69
LDI r1, 163
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 145
LDI r6, 56
LDI r7, 400
LDI r8, 233
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 26
LDI r12, 61
LDI r13, 120
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
