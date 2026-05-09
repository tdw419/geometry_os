; DESCRIPTION: Composite: Renders a orange line between points (47, 46) and (120, 8) then Places a magenta circle of radius 33 at center (274, 144).
; PLAN: r0=47(x1), r1=46(y1), r2=120(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=144(y), r7=33(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 47
LDI r1, 46
LDI r2, 120
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 144
LDI r7, 33
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
