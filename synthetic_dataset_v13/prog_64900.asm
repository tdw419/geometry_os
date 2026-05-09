; DESCRIPTION: Composite: Renders a orange disk with center (218, 58) and radius 42 then Places a red dot at position (360, 175) then Places a purple line segment connecting (169, 149) to (165, 217).
; PLAN: r0=218(x), r1=58(y), r2=42(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=169(x1), r11=149(y1), r12=165(x2), r13=217(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 58
LDI r2, 42
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 169
LDI r11, 149
LDI r12, 165
LDI r13, 217
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
