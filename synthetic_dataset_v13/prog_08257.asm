; DESCRIPTION: Composite: Renders a black disk with center (58, 53) and radius 20 then Places a white dot at position (182, 1) then Renders a magenta line between points (9, 124) and (497, 195).
; PLAN: r0=58(x), r1=53(y), r2=20(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=1(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=9(x1), r11=124(y1), r12=497(x2), r13=195(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 58
LDI r1, 53
LDI r2, 20
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 1
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 9
LDI r11, 124
LDI r12, 497
LDI r13, 195
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
