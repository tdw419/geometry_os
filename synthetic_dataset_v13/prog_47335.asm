; DESCRIPTION: Composite: Places a purple dot at position (346, 129) then Places a red circle of radius 45 at center (454, 149) then Renders a orange line between points (498, 100) and (133, 38).
; PLAN: r0=346(x), r1=129(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=454(x), r6=149(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=498(x1), r11=100(y1), r12=133(x2), r13=38(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 129
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 454
LDI r6, 149
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 498
LDI r11, 100
LDI r12, 133
LDI r13, 38
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
