; DESCRIPTION: Composite: Renders a red disk with center (455, 142) and radius 57 then Renders a magenta line between points (214, 22) and (383, 241).
; PLAN: r0=455(x), r1=142(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x1), r6=22(y1), r7=383(x2), r8=241(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 455
LDI r1, 142
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 22
LDI r7, 383
LDI r8, 241
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
