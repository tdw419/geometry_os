; DESCRIPTION: Composite: Places a magenta circle of radius 26 at center (53, 37) then Renders a yellow box of size 39x25 starting at (216, 142) then Renders a black line between points (459, 15) and (286, 251).
; PLAN: r0=53(x), r1=37(y), r2=26(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=142(y), r7=39(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=459(x1), r11=15(y1), r12=286(x2), r13=251(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 37
LDI r2, 26
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 142
LDI r7, 39
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 459
LDI r11, 15
LDI r12, 286
LDI r13, 251
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
