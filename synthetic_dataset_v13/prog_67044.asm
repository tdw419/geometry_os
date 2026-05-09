; DESCRIPTION: Composite: Draws a black circle centered at (374, 85) with radius 26 then Draws a red line from (243, 75) to (186, 17) then Renders a green box of size 41x41 starting at (65, 98).
; PLAN: r0=374(x), r1=85(y), r2=26(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x1), r6=75(y1), r7=186(x2), r8=17(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=65(x), r11=98(y), r12=41(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 85
LDI r2, 26
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 75
LDI r7, 186
LDI r8, 17
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 98
LDI r12, 41
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
