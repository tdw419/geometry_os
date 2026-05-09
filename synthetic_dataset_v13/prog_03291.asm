; DESCRIPTION: Composite: Draws a red circle centered at (107, 121) with radius 75 then Draws a purple line from (140, 134) to (430, 243) then Renders a red box of size 92x120 starting at (176, 123).
; PLAN: r0=107(x), r1=121(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=140(x1), r6=134(y1), r7=430(x2), r8=243(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=176(x), r11=123(y), r12=92(width), r13=120(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 107
LDI r1, 121
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 140
LDI r6, 134
LDI r7, 430
LDI r8, 243
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 123
LDI r12, 92
LDI r13, 120
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
