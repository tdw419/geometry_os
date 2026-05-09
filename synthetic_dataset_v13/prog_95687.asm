; DESCRIPTION: Composite: Renders a green line between points (328, 184) and (138, 229) then Creates a black circular shape at (404, 106) with radius 19.
; PLAN: r0=328(x1), r1=184(y1), r2=138(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=106(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 328
LDI r1, 184
LDI r2, 138
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 106
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
