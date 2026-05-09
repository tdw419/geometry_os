; DESCRIPTION: Composite: Places a white line segment connecting (129, 173) to (332, 0) then Renders a magenta disk with center (241, 221) and radius 10 then Sets a single white pixel at (368, 175).
; PLAN: r0=129(x1), r1=173(y1), r2=332(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=241(x), r6=221(y), r7=10(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=368(x), r11=175(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 129
LDI r1, 173
LDI r2, 332
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 241
LDI r6, 221
LDI r7, 10
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 368
LDI r11, 175
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
