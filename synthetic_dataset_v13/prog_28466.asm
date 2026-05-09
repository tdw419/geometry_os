; DESCRIPTION: Composite: Renders a purple line between points (288, 197) and (160, 198) then Renders a white box of size 38x88 starting at (256, 0) then Places a black dot at position (188, 112).
; PLAN: r0=288(x1), r1=197(y1), r2=160(x2), r3=198(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=256(x), r6=0(y), r7=38(width), r8=88(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=188(x), r11=112(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 288
LDI r1, 197
LDI r2, 160
LDI r3, 198
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 0
LDI r7, 38
LDI r8, 88
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 188
LDI r11, 112
LDI r12, 0x000000
PSET r10, r11, r12
HALT
