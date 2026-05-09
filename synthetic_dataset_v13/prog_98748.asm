; DESCRIPTION: Composite: Places a magenta dot at position (419, 155) then Places a blue line segment connecting (243, 247) to (115, 201) then Places a magenta circle of radius 38 at center (158, 134).
; PLAN: r0=419(x), r1=155(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=243(x1), r6=247(y1), r7=115(x2), r8=201(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=158(x), r11=134(y), r12=38(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 419
LDI r1, 155
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 243
LDI r6, 247
LDI r7, 115
LDI r8, 201
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 158
LDI r11, 134
LDI r12, 38
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
