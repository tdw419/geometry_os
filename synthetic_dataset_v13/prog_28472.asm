; DESCRIPTION: Composite: Renders a yellow line between points (462, 182) and (342, 7) then Renders a red disk with center (349, 166) and radius 64.
; PLAN: r0=462(x1), r1=182(y1), r2=342(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=349(x), r6=166(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 182
LDI r2, 342
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 166
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
