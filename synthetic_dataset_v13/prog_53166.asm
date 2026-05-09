; DESCRIPTION: Composite: Creates a red circular shape at (174, 117) with radius 70 then Sets a single yellow pixel at (192, 30) then Renders a yellow line between points (416, 127) and (481, 212).
; PLAN: r0=174(x), r1=117(y), r2=70(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=192(x), r6=30(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=416(x1), r11=127(y1), r12=481(x2), r13=212(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 117
LDI r2, 70
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 192
LDI r6, 30
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 416
LDI r11, 127
LDI r12, 481
LDI r13, 212
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
