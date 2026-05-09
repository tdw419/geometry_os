; DESCRIPTION: Composite: Renders a orange box of size 62x34 starting at (115, 217) then Places a cyan circle of radius 51 at center (447, 53) then Draws a black line from (36, 127) to (300, 251).
; PLAN: r0=115(x), r1=217(y), r2=62(width), r3=34(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=447(x), r6=53(y), r7=51(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=36(x1), r11=127(y1), r12=300(x2), r13=251(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 115
LDI r1, 217
LDI r2, 62
LDI r3, 34
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 447
LDI r6, 53
LDI r7, 51
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 36
LDI r11, 127
LDI r12, 300
LDI r13, 251
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
