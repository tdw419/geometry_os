; DESCRIPTION: Composite: Sets a single cyan pixel at (33, 183) then Creates a orange circular shape at (62, 189) with radius 12 then Places a blue line segment connecting (191, 230) to (452, 102).
; PLAN: r0=33(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=62(x), r6=189(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=191(x1), r11=230(y1), r12=452(x2), r13=102(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 62
LDI r6, 189
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 191
LDI r11, 230
LDI r12, 452
LDI r13, 102
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
