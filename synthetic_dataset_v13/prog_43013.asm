; DESCRIPTION: Composite: Renders a magenta line between points (501, 222) and (483, 81) then Places a yellow dot at position (261, 191) then Renders a yellow box of size 82x11 starting at (194, 218).
; PLAN: r0=501(x1), r1=222(y1), r2=483(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=191(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=194(x), r11=218(y), r12=82(width), r13=11(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 501
LDI r1, 222
LDI r2, 483
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 191
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 194
LDI r11, 218
LDI r12, 82
LDI r13, 11
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
