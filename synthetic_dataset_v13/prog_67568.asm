; DESCRIPTION: Composite: Draws a blue line from (205, 126) to (80, 41) then Creates a yellow rectangular region at (186, 29) spanning 115 by 45 pixels then Renders a cyan disk with center (88, 128) and radius 71.
; PLAN: r0=205(x1), r1=126(y1), r2=80(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=186(x), r6=29(y), r7=115(width), r8=45(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=88(x), r11=128(y), r12=71(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 126
LDI r2, 80
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 186
LDI r6, 29
LDI r7, 115
LDI r8, 45
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 88
LDI r11, 128
LDI r12, 71
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
