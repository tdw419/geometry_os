; DESCRIPTION: Composite: Renders a red box of size 46x117 starting at (256, 60) then Draws a orange line from (300, 88) to (355, 55) then Sets a single yellow pixel at (462, 103).
; PLAN: r0=256(x), r1=60(y), r2=46(width), r3=117(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x1), r6=88(y1), r7=355(x2), r8=55(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=462(x), r11=103(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 256
LDI r1, 60
LDI r2, 46
LDI r3, 117
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 88
LDI r7, 355
LDI r8, 55
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 462
LDI r11, 103
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
