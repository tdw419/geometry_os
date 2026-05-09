; DESCRIPTION: Composite: Renders a black disk with center (110, 182) and radius 47 then Places a yellow dot at position (450, 104) then Places a red line segment connecting (392, 28) to (402, 157).
; PLAN: r0=110(x), r1=182(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=450(x), r6=104(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=392(x1), r11=28(y1), r12=402(x2), r13=157(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 182
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 450
LDI r6, 104
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 392
LDI r11, 28
LDI r12, 402
LDI r13, 157
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
