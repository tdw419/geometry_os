; DESCRIPTION: Composite: Creates a magenta rectangular region at (150, 188) spanning 103 by 47 pixels then Creates a white circular shape at (300, 206) with radius 23 then Renders a red line between points (346, 32) and (457, 105).
; PLAN: r0=150(x), r1=188(y), r2=103(width), r3=47(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=206(y), r7=23(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=346(x1), r11=32(y1), r12=457(x2), r13=105(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 188
LDI r2, 103
LDI r3, 47
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 206
LDI r7, 23
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 346
LDI r11, 32
LDI r12, 457
LDI r13, 105
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
