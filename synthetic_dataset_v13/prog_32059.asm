; DESCRIPTION: Composite: Sets a single yellow pixel at (285, 5) then Renders a magenta disk with center (473, 88) and radius 18 then Places a magenta line segment connecting (182, 61) to (368, 141).
; PLAN: r0=285(x), r1=5(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=473(x), r6=88(y), r7=18(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=182(x1), r11=61(y1), r12=368(x2), r13=141(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 5
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 473
LDI r6, 88
LDI r7, 18
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 182
LDI r11, 61
LDI r12, 368
LDI r13, 141
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
