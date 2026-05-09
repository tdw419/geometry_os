; DESCRIPTION: Composite: Sets a single purple pixel at (199, 6) then Renders a orange line between points (394, 98) and (341, 254) then Renders a blue disk with center (215, 121) and radius 46.
; PLAN: r0=199(x), r1=6(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=394(x1), r6=98(y1), r7=341(x2), r8=254(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=215(x), r11=121(y), r12=46(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 199
LDI r1, 6
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 394
LDI r6, 98
LDI r7, 341
LDI r8, 254
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 215
LDI r11, 121
LDI r12, 46
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
