; DESCRIPTION: Composite: Places a green circle of radius 64 at center (136, 118) then Places a white dot at position (282, 195) then Places a blue line segment connecting (485, 228) to (92, 59).
; PLAN: r0=136(x), r1=118(y), r2=64(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x), r6=195(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=485(x1), r11=228(y1), r12=92(x2), r13=59(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 136
LDI r1, 118
LDI r2, 64
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 195
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 485
LDI r11, 228
LDI r12, 92
LDI r13, 59
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
