; DESCRIPTION: Composite: Places a yellow line segment connecting (304, 202) to (468, 89) then Places a magenta circle of radius 62 at center (142, 160).
; PLAN: r0=304(x1), r1=202(y1), r2=468(x2), r3=89(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=142(x), r6=160(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 304
LDI r1, 202
LDI r2, 468
LDI r3, 89
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 160
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
