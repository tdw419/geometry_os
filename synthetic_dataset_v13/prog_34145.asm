; DESCRIPTION: Composite: Creates a magenta circular shape at (436, 185) with radius 69 then Renders a magenta line between points (76, 240) and (241, 210) then Places a white dot at position (508, 192).
; PLAN: r0=436(x), r1=185(y), r2=69(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x1), r6=240(y1), r7=241(x2), r8=210(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=508(x), r11=192(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 185
LDI r2, 69
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 240
LDI r7, 241
LDI r8, 210
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 508
LDI r11, 192
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
