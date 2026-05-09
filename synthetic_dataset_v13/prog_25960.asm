; DESCRIPTION: Composite: Renders a purple disk with center (121, 196) and radius 55 then Sets a single yellow pixel at (182, 193) then Renders a red line between points (267, 212) and (307, 34).
; PLAN: r0=121(x), r1=196(y), r2=55(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=182(x), r6=193(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=267(x1), r11=212(y1), r12=307(x2), r13=34(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 196
LDI r2, 55
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 182
LDI r6, 193
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 267
LDI r11, 212
LDI r12, 307
LDI r13, 34
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
