; DESCRIPTION: Composite: Places a white circle of radius 38 at center (121, 162) then Places a green dot at position (382, 253) then Places a orange line segment connecting (339, 151) to (105, 30).
; PLAN: r0=121(x), r1=162(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=382(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=339(x1), r11=151(y1), r12=105(x2), r13=30(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 121
LDI r1, 162
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 382
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 339
LDI r11, 151
LDI r12, 105
LDI r13, 30
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
