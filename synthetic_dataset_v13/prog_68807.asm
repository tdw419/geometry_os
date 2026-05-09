; DESCRIPTION: Composite: Sets a single black pixel at (49, 60) then Creates a red circular shape at (254, 202) with radius 51 then Renders a yellow line between points (410, 144) and (148, 73).
; PLAN: r0=49(x), r1=60(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=254(x), r6=202(y), r7=51(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=410(x1), r11=144(y1), r12=148(x2), r13=73(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 49
LDI r1, 60
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 254
LDI r6, 202
LDI r7, 51
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 410
LDI r11, 144
LDI r12, 148
LDI r13, 73
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
