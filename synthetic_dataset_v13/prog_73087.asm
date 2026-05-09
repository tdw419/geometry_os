; DESCRIPTION: Composite: Renders a red box of size 62x91 starting at (423, 78) then Places a yellow dot at position (217, 87) then Renders a red line between points (451, 200) and (197, 121).
; PLAN: r0=423(x), r1=78(y), r2=62(width), r3=91(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=87(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=451(x1), r11=200(y1), r12=197(x2), r13=121(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 423
LDI r1, 78
LDI r2, 62
LDI r3, 91
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 87
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 451
LDI r11, 200
LDI r12, 197
LDI r13, 121
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
