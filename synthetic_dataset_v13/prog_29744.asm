; DESCRIPTION: Composite: Sets a single red pixel at (457, 192) then Places a orange circle of radius 68 at center (366, 109) then Renders a cyan line between points (493, 127) and (397, 138).
; PLAN: r0=457(x), r1=192(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=366(x), r6=109(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=493(x1), r11=127(y1), r12=397(x2), r13=138(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 457
LDI r1, 192
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 366
LDI r6, 109
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 493
LDI r11, 127
LDI r12, 397
LDI r13, 138
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
