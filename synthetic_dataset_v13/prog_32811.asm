; DESCRIPTION: Composite: Places a red dot at position (158, 108) then Creates a blue circular shape at (300, 143) with radius 71 then Places a blue line segment connecting (128, 116) to (77, 109).
; PLAN: r0=158(x), r1=108(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=300(x), r6=143(y), r7=71(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=128(x1), r11=116(y1), r12=77(x2), r13=109(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 108
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 300
LDI r6, 143
LDI r7, 71
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 128
LDI r11, 116
LDI r12, 77
LDI r13, 109
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
