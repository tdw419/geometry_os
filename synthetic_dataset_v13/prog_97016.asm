; DESCRIPTION: Composite: Renders a magenta line between points (112, 239) and (200, 252) then Places a magenta circle of radius 57 at center (251, 118).
; PLAN: r0=112(x1), r1=239(y1), r2=200(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=118(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 112
LDI r1, 239
LDI r2, 200
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 118
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
