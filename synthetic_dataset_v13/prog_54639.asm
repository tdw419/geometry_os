; DESCRIPTION: Composite: Places a cyan line segment connecting (510, 243) to (51, 254) then Creates a blue rectangular region at (58, 65) spanning 109 by 63 pixels then Renders a white disk with center (466, 190) and radius 40.
; PLAN: r0=510(x1), r1=243(y1), r2=51(x2), r3=254(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=58(x), r6=65(y), r7=109(width), r8=63(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=466(x), r11=190(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 510
LDI r1, 243
LDI r2, 51
LDI r3, 254
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 58
LDI r6, 65
LDI r7, 109
LDI r8, 63
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 466
LDI r11, 190
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
