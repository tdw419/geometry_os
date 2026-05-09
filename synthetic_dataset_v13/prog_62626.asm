; DESCRIPTION: Composite: Creates a red rectangular region at (445, 2) spanning 42 by 108 pixels then Creates a yellow circular shape at (288, 89) with radius 11 then Renders a blue line between points (79, 145) and (70, 82).
; PLAN: r0=445(x), r1=2(y), r2=42(width), r3=108(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x), r6=89(y), r7=11(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=79(x1), r11=145(y1), r12=70(x2), r13=82(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 2
LDI r2, 42
LDI r3, 108
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 89
LDI r7, 11
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 79
LDI r11, 145
LDI r12, 70
LDI r13, 82
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
