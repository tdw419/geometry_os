; DESCRIPTION: Composite: Renders a magenta disk with center (61, 163) and radius 45 then Renders a purple line between points (362, 240) and (295, 53).
; PLAN: r0=61(x), r1=163(y), r2=45(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=362(x1), r6=240(y1), r7=295(x2), r8=53(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 61
LDI r1, 163
LDI r2, 45
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 362
LDI r6, 240
LDI r7, 295
LDI r8, 53
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
