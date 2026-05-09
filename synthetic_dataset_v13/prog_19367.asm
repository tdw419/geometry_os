; DESCRIPTION: Composite: Creates a green rectangular region at (222, 159) spanning 74 by 60 pixels then Sets a single magenta pixel at (327, 184) then Places a red line segment connecting (38, 56) to (395, 233).
; PLAN: r0=222(x), r1=159(y), r2=74(width), r3=60(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=184(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=38(x1), r11=56(y1), r12=395(x2), r13=233(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 159
LDI r2, 74
LDI r3, 60
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 184
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 38
LDI r11, 56
LDI r12, 395
LDI r13, 233
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
