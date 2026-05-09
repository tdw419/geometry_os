; DESCRIPTION: Composite: Sets a single blue pixel at (136, 69) then Places a magenta line segment connecting (149, 176) to (126, 194) then Renders a cyan disk with center (439, 98) and radius 55.
; PLAN: r0=136(x), r1=69(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=149(x1), r6=176(y1), r7=126(x2), r8=194(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=439(x), r11=98(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 136
LDI r1, 69
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 149
LDI r6, 176
LDI r7, 126
LDI r8, 194
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 439
LDI r11, 98
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
