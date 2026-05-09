; DESCRIPTION: Composite: Renders a black box of size 86x75 starting at (236, 95) then Places a white circle of radius 18 at center (471, 55) then Places a cyan line segment connecting (262, 200) to (26, 11).
; PLAN: r0=236(x), r1=95(y), r2=86(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=471(x), r6=55(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=262(x1), r11=200(y1), r12=26(x2), r13=11(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 236
LDI r1, 95
LDI r2, 86
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 471
LDI r6, 55
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 262
LDI r11, 200
LDI r12, 26
LDI r13, 11
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
