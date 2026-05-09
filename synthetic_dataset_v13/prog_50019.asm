; DESCRIPTION: Composite: Renders a yellow line between points (9, 210) and (208, 19) then Places a green circle of radius 48 at center (73, 208).
; PLAN: r0=9(x1), r1=210(y1), r2=208(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=73(x), r6=208(y), r7=48(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 9
LDI r1, 210
LDI r2, 208
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 208
LDI r7, 48
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
