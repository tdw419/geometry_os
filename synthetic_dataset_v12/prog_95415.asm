; DESCRIPTION: Composite: Draws a purple line from (61, 118) to (288, 83) then Draws a green circle centered at (54, 48) with radius 30 then Renders a orange box of size 75x51 starting at (24, 205).
; PLAN: r0=61(x1), r1=118(y1), r2=288(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=54(x), r6=48(y), r7=30(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=205(y), r12=75(width), r13=51(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 118
LDI r2, 288
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 54
LDI r6, 48
LDI r7, 30
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 205
LDI r12, 75
LDI r13, 51
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
