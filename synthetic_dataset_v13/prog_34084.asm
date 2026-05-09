; DESCRIPTION: Composite: Sets a single purple pixel at (89, 173) then Renders a blue disk with center (93, 136) and radius 53 then Draws a red line from (80, 167) to (63, 231).
; PLAN: r0=89(x), r1=173(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=93(x), r6=136(y), r7=53(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=80(x1), r11=167(y1), r12=63(x2), r13=231(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 89
LDI r1, 173
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 93
LDI r6, 136
LDI r7, 53
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 80
LDI r11, 167
LDI r12, 63
LDI r13, 231
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
