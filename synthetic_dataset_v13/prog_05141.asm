; DESCRIPTION: Composite: Renders a magenta line between points (204, 210) and (415, 208) then Creates a blue circular shape at (137, 172) with radius 50 then Places a orange dot at position (179, 72).
; PLAN: r0=204(x1), r1=210(y1), r2=415(x2), r3=208(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=137(x), r6=172(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=179(x), r11=72(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 210
LDI r2, 415
LDI r3, 208
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 137
LDI r6, 172
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 179
LDI r11, 72
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
