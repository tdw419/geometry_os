; DESCRIPTION: Composite: Sets a single purple pixel at (176, 49) then Places a yellow circle of radius 58 at center (340, 72) then Renders a magenta line between points (503, 167) and (28, 35).
; PLAN: r0=176(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=72(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=503(x1), r11=167(y1), r12=28(x2), r13=35(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 340
LDI r6, 72
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 503
LDI r11, 167
LDI r12, 28
LDI r13, 35
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
