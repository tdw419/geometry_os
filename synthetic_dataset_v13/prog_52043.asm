; DESCRIPTION: Composite: Places a red dot at position (474, 221) then Renders a blue disk with center (408, 88) and radius 63 then Renders a cyan line between points (476, 91) and (162, 237).
; PLAN: r0=474(x), r1=221(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=408(x), r6=88(y), r7=63(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x1), r11=91(y1), r12=162(x2), r13=237(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 474
LDI r1, 221
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 408
LDI r6, 88
LDI r7, 63
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 91
LDI r12, 162
LDI r13, 237
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
