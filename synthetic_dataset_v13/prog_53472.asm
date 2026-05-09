; DESCRIPTION: Composite: Renders a green disk with center (382, 169) and radius 59 then Draws a magenta line from (447, 179) to (488, 183).
; PLAN: r0=382(x), r1=169(y), r2=59(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=447(x1), r6=179(y1), r7=488(x2), r8=183(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 382
LDI r1, 169
LDI r2, 59
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 447
LDI r6, 179
LDI r7, 488
LDI r8, 183
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
