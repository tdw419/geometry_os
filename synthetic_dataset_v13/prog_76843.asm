; DESCRIPTION: Composite: Creates a blue rectangular region at (350, 107) spanning 13 by 115 pixels then Renders a magenta line between points (327, 51) and (188, 131) then Sets a single green pixel at (374, 9).
; PLAN: r0=350(x), r1=107(y), r2=13(width), r3=115(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x1), r6=51(y1), r7=188(x2), r8=131(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=374(x), r11=9(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 350
LDI r1, 107
LDI r2, 13
LDI r3, 115
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 51
LDI r7, 188
LDI r8, 131
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 374
LDI r11, 9
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
