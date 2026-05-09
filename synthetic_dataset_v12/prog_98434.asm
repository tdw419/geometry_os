; DESCRIPTION: Composite: Places a purple 20x26 rectangle at position (79, 110) then Places a blue dot at position (327, 233) then Places a yellow circle of radius 43 at center (254, 162).
; PLAN: r0=79(x), r1=110(y), r2=20(width), r3=26(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=327(x), r6=233(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=162(y), r12=43(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 79
LDI r1, 110
LDI r2, 20
LDI r3, 26
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 233
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 254
LDI r11, 162
LDI r12, 43
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
