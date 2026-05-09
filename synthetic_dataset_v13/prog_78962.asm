; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 190) then Renders a purple disk with center (327, 93) and radius 52 then Places a magenta line segment connecting (194, 233) to (178, 88).
; PLAN: r0=270(x), r1=190(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=93(y), r7=52(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=194(x1), r11=233(y1), r12=178(x2), r13=88(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 190
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 93
LDI r7, 52
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 194
LDI r11, 233
LDI r12, 178
LDI r13, 88
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
