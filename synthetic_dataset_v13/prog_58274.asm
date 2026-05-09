; DESCRIPTION: Composite: Places a blue 98x95 rectangle at position (104, 112) then Places a blue dot at position (306, 147) then Renders a magenta line between points (274, 212) and (510, 102).
; PLAN: r0=104(x), r1=112(y), r2=98(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=306(x), r6=147(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=274(x1), r11=212(y1), r12=510(x2), r13=102(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 104
LDI r1, 112
LDI r2, 98
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 306
LDI r6, 147
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 274
LDI r11, 212
LDI r12, 510
LDI r13, 102
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
