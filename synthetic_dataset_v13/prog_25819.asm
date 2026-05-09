; DESCRIPTION: Composite: Creates a yellow rectangular region at (434, 18) spanning 43 by 49 pixels then Renders a green line between points (446, 132) and (300, 25) then Renders a orange disk with center (68, 121) and radius 11.
; PLAN: r0=434(x), r1=18(y), r2=43(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=446(x1), r6=132(y1), r7=300(x2), r8=25(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=68(x), r11=121(y), r12=11(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 434
LDI r1, 18
LDI r2, 43
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 132
LDI r7, 300
LDI r8, 25
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 68
LDI r11, 121
LDI r12, 11
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
