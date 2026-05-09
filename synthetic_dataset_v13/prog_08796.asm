; DESCRIPTION: Composite: Places a green line segment connecting (186, 182) to (166, 106) then Renders a purple disk with center (151, 153) and radius 57.
; PLAN: r0=186(x1), r1=182(y1), r2=166(x2), r3=106(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=151(x), r6=153(y), r7=57(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 182
LDI r2, 166
LDI r3, 106
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 153
LDI r7, 57
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
