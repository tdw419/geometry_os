; DESCRIPTION: Composite: Draws a red line from (92, 107) to (20, 187) then Renders a magenta box of size 101x94 starting at (297, 100) then Places a blue circle of radius 21 at center (452, 91).
; PLAN: r0=92(x1), r1=107(y1), r2=20(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=100(y), r7=101(width), r8=94(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=452(x), r11=91(y), r12=21(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 92
LDI r1, 107
LDI r2, 20
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 100
LDI r7, 101
LDI r8, 94
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 91
LDI r12, 21
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
