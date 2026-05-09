; DESCRIPTION: Composite: Renders a red box of size 117x83 starting at (374, 0) then Draws a orange circle centered at (300, 77) with radius 50 then Draws a purple line from (265, 2) to (335, 3).
; PLAN: r0=374(x), r1=0(y), r2=117(width), r3=83(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=77(y), r7=50(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=265(x1), r11=2(y1), r12=335(x2), r13=3(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 374
LDI r1, 0
LDI r2, 117
LDI r3, 83
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 77
LDI r7, 50
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 265
LDI r11, 2
LDI r12, 335
LDI r13, 3
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
