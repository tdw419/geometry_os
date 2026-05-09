; DESCRIPTION: Composite: Places a magenta circle of radius 67 at center (285, 138) then Places a green line segment connecting (19, 204) to (411, 130) then Sets a single yellow pixel at (241, 184).
; PLAN: r0=285(x), r1=138(y), r2=67(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=19(x1), r6=204(y1), r7=411(x2), r8=130(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=241(x), r11=184(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 285
LDI r1, 138
LDI r2, 67
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 19
LDI r6, 204
LDI r7, 411
LDI r8, 130
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 184
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
