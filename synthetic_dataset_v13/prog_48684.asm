; DESCRIPTION: Composite: Renders a green line between points (74, 179) and (390, 80) then Creates a white circular shape at (239, 157) with radius 51 then Places a cyan 52x96 rectangle at position (430, 121).
; PLAN: r0=74(x1), r1=179(y1), r2=390(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=157(y), r7=51(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=430(x), r11=121(y), r12=52(width), r13=96(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 179
LDI r2, 390
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 157
LDI r7, 51
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 430
LDI r11, 121
LDI r12, 52
LDI r13, 96
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
