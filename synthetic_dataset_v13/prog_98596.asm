; DESCRIPTION: Composite: Creates a purple circular shape at (214, 131) with radius 49 then Sets a single yellow pixel at (338, 39) then Places a blue line segment connecting (24, 93) to (71, 124).
; PLAN: r0=214(x), r1=131(y), r2=49(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=39(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=24(x1), r11=93(y1), r12=71(x2), r13=124(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 131
LDI r2, 49
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 39
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 24
LDI r11, 93
LDI r12, 71
LDI r13, 124
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
