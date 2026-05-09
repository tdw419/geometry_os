; DESCRIPTION: Composite: Renders a red disk with center (399, 152) and radius 44 then Draws a orange rectangle at (35, 61) with width 113 and height 30 then Draws a purple line from (165, 179) to (303, 216).
; PLAN: r0=399(x), r1=152(y), r2=44(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x), r6=61(y), r7=113(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=165(x1), r11=179(y1), r12=303(x2), r13=216(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 399
LDI r1, 152
LDI r2, 44
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 61
LDI r7, 113
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 165
LDI r11, 179
LDI r12, 303
LDI r13, 216
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
