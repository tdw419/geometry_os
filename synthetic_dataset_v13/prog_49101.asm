; DESCRIPTION: Composite: Renders a magenta line between points (141, 183) and (286, 233) then Places a green dot at position (200, 123).
; PLAN: r0=141(x1), r1=183(y1), r2=286(x2), r3=233(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=200(x), r6=123(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 141
LDI r1, 183
LDI r2, 286
LDI r3, 233
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 200
LDI r6, 123
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
