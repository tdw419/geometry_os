; DESCRIPTION: Composite: Places a cyan line segment connecting (504, 238) to (273, 134) then Creates a cyan rectangular region at (35, 156) spanning 22 by 80 pixels then Renders a yellow disk with center (160, 119) and radius 51.
; PLAN: r0=504(x1), r1=238(y1), r2=273(x2), r3=134(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=156(y), r7=22(width), r8=80(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=160(x), r11=119(y), r12=51(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 504
LDI r1, 238
LDI r2, 273
LDI r3, 134
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 156
LDI r7, 22
LDI r8, 80
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 160
LDI r11, 119
LDI r12, 51
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
