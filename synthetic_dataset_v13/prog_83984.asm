; DESCRIPTION: Composite: Places a white line segment connecting (429, 193) to (427, 131) then Creates a magenta rectangular region at (187, 182) spanning 88 by 56 pixels then Renders a cyan disk with center (245, 147) and radius 38.
; PLAN: r0=429(x1), r1=193(y1), r2=427(x2), r3=131(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=187(x), r6=182(y), r7=88(width), r8=56(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=245(x), r11=147(y), r12=38(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 429
LDI r1, 193
LDI r2, 427
LDI r3, 131
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 187
LDI r6, 182
LDI r7, 88
LDI r8, 56
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 245
LDI r11, 147
LDI r12, 38
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
