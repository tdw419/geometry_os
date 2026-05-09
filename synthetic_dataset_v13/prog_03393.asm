; DESCRIPTION: Composite: Draws a blue line from (158, 86) to (349, 212) then Renders a white disk with center (239, 115) and radius 49 then Renders a black box of size 80x106 starting at (187, 44).
; PLAN: r0=158(x1), r1=86(y1), r2=349(x2), r3=212(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=115(y), r7=49(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=187(x), r11=44(y), r12=80(width), r13=106(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 158
LDI r1, 86
LDI r2, 349
LDI r3, 212
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 115
LDI r7, 49
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 187
LDI r11, 44
LDI r12, 80
LDI r13, 106
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
