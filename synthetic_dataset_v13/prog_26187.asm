; DESCRIPTION: Composite: Renders a magenta line between points (70, 81) and (458, 253) then Places a green circle of radius 71 at center (182, 169) then Sets a single green pixel at (511, 104).
; PLAN: r0=70(x1), r1=81(y1), r2=458(x2), r3=253(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=182(x), r6=169(y), r7=71(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=511(x), r11=104(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 70
LDI r1, 81
LDI r2, 458
LDI r3, 253
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 169
LDI r7, 71
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 511
LDI r11, 104
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
