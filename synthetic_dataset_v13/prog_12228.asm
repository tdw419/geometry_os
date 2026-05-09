; DESCRIPTION: Composite: Places a cyan dot at position (358, 15) then Renders a purple disk with center (200, 173) and radius 72 then Places a orange line segment connecting (483, 156) to (416, 34).
; PLAN: r0=358(x), r1=15(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=173(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x1), r11=156(y1), r12=416(x2), r13=34(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 358
LDI r1, 15
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 200
LDI r6, 173
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 156
LDI r12, 416
LDI r13, 34
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
