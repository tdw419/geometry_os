; DESCRIPTION: Composite: Renders a magenta disk with center (165, 104) and radius 48 then Sets a single cyan pixel at (73, 97) then Places a green line segment connecting (385, 182) to (138, 160).
; PLAN: r0=165(x), r1=104(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=73(x), r6=97(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=385(x1), r11=182(y1), r12=138(x2), r13=160(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 165
LDI r1, 104
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 73
LDI r6, 97
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 385
LDI r11, 182
LDI r12, 138
LDI r13, 160
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
