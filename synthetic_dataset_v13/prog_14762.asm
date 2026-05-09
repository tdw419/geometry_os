; DESCRIPTION: Composite: Sets a single purple pixel at (325, 180) then Places a magenta circle of radius 36 at center (368, 81) then Renders a yellow line between points (90, 16) and (141, 131).
; PLAN: r0=325(x), r1=180(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=81(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=90(x1), r11=16(y1), r12=141(x2), r13=131(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 325
LDI r1, 180
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 81
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 90
LDI r11, 16
LDI r12, 141
LDI r13, 131
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
