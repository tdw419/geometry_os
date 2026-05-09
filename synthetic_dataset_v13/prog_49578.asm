; DESCRIPTION: Composite: Draws a magenta circle centered at (52, 61) with radius 51 then Places a white line segment connecting (494, 10) to (14, 97) then Renders a black box of size 38x34 starting at (89, 4).
; PLAN: r0=52(x), r1=61(y), r2=51(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=494(x1), r6=10(y1), r7=14(x2), r8=97(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=89(x), r11=4(y), r12=38(width), r13=34(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 52
LDI r1, 61
LDI r2, 51
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 494
LDI r6, 10
LDI r7, 14
LDI r8, 97
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 89
LDI r11, 4
LDI r12, 38
LDI r13, 34
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
