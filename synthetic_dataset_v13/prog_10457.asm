; DESCRIPTION: Composite: Places a green line segment connecting (300, 127) to (292, 22) then Creates a red circular shape at (93, 112) with radius 77 then Places a purple 79x16 rectangle at position (62, 7).
; PLAN: r0=300(x1), r1=127(y1), r2=292(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=112(y), r7=77(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=62(x), r11=7(y), r12=79(width), r13=16(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 127
LDI r2, 292
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 112
LDI r7, 77
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 62
LDI r11, 7
LDI r12, 79
LDI r13, 16
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
