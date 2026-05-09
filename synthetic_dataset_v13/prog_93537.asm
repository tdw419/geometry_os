; DESCRIPTION: Composite: Places a blue dot at position (221, 84) then Draws a cyan line from (158, 246) to (274, 204) then Renders a blue disk with center (264, 171) and radius 53.
; PLAN: r0=221(x), r1=84(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=158(x1), r6=246(y1), r7=274(x2), r8=204(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=264(x), r11=171(y), r12=53(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 221
LDI r1, 84
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 158
LDI r6, 246
LDI r7, 274
LDI r8, 204
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 264
LDI r11, 171
LDI r12, 53
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
