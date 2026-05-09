; DESCRIPTION: Composite: Places a purple dot at position (328, 120) then Places a orange circle of radius 48 at center (261, 149) then Places a green line segment connecting (133, 45) to (16, 58).
; PLAN: r0=328(x), r1=120(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=261(x), r6=149(y), r7=48(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x1), r11=45(y1), r12=16(x2), r13=58(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 328
LDI r1, 120
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 261
LDI r6, 149
LDI r7, 48
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 45
LDI r12, 16
LDI r13, 58
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
