; DESCRIPTION: Composite: Sets a single purple pixel at (172, 194) then Renders a green line between points (173, 11) and (109, 22) then Places a red circle of radius 25 at center (165, 216).
; PLAN: r0=172(x), r1=194(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=173(x1), r6=11(y1), r7=109(x2), r8=22(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=165(x), r11=216(y), r12=25(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 172
LDI r1, 194
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 173
LDI r6, 11
LDI r7, 109
LDI r8, 22
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 216
LDI r12, 25
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
