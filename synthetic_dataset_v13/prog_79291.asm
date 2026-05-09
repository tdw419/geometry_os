; DESCRIPTION: Composite: Renders a purple line between points (2, 169) and (184, 195) then Places a white dot at position (160, 102) then Renders a yellow box of size 28x59 starting at (470, 99).
; PLAN: r0=2(x1), r1=169(y1), r2=184(x2), r3=195(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=160(x), r6=102(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=470(x), r11=99(y), r12=28(width), r13=59(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 169
LDI r2, 184
LDI r3, 195
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 102
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 99
LDI r12, 28
LDI r13, 59
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
