; DESCRIPTION: Composite: Draws a white rectangle at (2, 18) with width 38 and height 35 then Places a black circle of radius 28 at center (410, 32) then Draws a purple line from (497, 194) to (106, 121).
; PLAN: r0=2(x), r1=18(y), r2=38(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=410(x), r6=32(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x1), r11=194(y1), r12=106(x2), r13=121(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 2
LDI r1, 18
LDI r2, 38
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 410
LDI r6, 32
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 194
LDI r12, 106
LDI r13, 121
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
