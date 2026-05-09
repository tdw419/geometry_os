; DESCRIPTION: Composite: Creates a green rectangular region at (385, 8) spanning 93 by 117 pixels then Draws a orange circle centered at (301, 190) with radius 60 then Places a green line segment connecting (423, 14) to (262, 80).
; PLAN: r0=385(x), r1=8(y), r2=93(width), r3=117(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=190(y), r7=60(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x1), r11=14(y1), r12=262(x2), r13=80(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 8
LDI r2, 93
LDI r3, 117
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 190
LDI r7, 60
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 14
LDI r12, 262
LDI r13, 80
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
