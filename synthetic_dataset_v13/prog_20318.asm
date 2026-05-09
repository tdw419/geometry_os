; DESCRIPTION: Composite: Creates a yellow rectangular region at (255, 39) spanning 33 by 85 pixels then Creates a magenta circular shape at (120, 69) with radius 22 then Renders a yellow line between points (87, 183) and (301, 180).
; PLAN: r0=255(x), r1=39(y), r2=33(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=120(x), r6=69(y), r7=22(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=87(x1), r11=183(y1), r12=301(x2), r13=180(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 39
LDI r2, 33
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 120
LDI r6, 69
LDI r7, 22
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 87
LDI r11, 183
LDI r12, 301
LDI r13, 180
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
