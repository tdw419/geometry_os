; DESCRIPTION: Composite: Creates a magenta circular shape at (376, 60) with radius 51 then Renders a white line between points (305, 131) and (60, 2) then Sets a single blue pixel at (374, 205).
; PLAN: r0=376(x), r1=60(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x1), r6=131(y1), r7=60(x2), r8=2(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=205(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 376
LDI r1, 60
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 131
LDI r7, 60
LDI r8, 2
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 205
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
