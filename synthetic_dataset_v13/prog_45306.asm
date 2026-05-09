; DESCRIPTION: Composite: Renders a green box of size 12x66 starting at (148, 182) then Draws a blue line from (101, 147) to (217, 52).
; PLAN: r0=148(x), r1=182(y), r2=12(width), r3=66(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=101(x1), r6=147(y1), r7=217(x2), r8=52(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 148
LDI r1, 182
LDI r2, 12
LDI r3, 66
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 101
LDI r6, 147
LDI r7, 217
LDI r8, 52
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
