; DESCRIPTION: Composite: Sets a single black pixel at (393, 142) then Draws a cyan circle centered at (342, 128) with radius 43 then Places a cyan line segment connecting (419, 137) to (239, 205).
; PLAN: r0=393(x), r1=142(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=342(x), r6=128(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=419(x1), r11=137(y1), r12=239(x2), r13=205(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 142
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 342
LDI r6, 128
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 419
LDI r11, 137
LDI r12, 239
LDI r13, 205
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
