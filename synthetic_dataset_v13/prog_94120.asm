; DESCRIPTION: Composite: Places a magenta dot at position (121, 245) then Places a red line segment connecting (388, 79) to (262, 94) then Places a orange circle of radius 68 at center (314, 177).
; PLAN: r0=121(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=388(x1), r6=79(y1), r7=262(x2), r8=94(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=177(y), r12=68(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 121
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 388
LDI r6, 79
LDI r7, 262
LDI r8, 94
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 177
LDI r12, 68
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
