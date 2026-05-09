; DESCRIPTION: Composite: Places a orange dot at position (109, 121) then Places a cyan circle of radius 77 at center (304, 85) then Places a black line segment connecting (200, 174) to (116, 112).
; PLAN: r0=109(x), r1=121(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=304(x), r6=85(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=200(x1), r11=174(y1), r12=116(x2), r13=112(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 109
LDI r1, 121
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 304
LDI r6, 85
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 200
LDI r11, 174
LDI r12, 116
LDI r13, 112
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
