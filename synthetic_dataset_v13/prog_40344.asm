; DESCRIPTION: Composite: Places a purple line segment connecting (53, 115) to (206, 54) then Places a magenta dot at position (425, 187) then Draws a yellow rectangle at (40, 49) with width 32 and height 36.
; PLAN: r0=53(x1), r1=115(y1), r2=206(x2), r3=54(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=187(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=40(x), r11=49(y), r12=32(width), r13=36(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 53
LDI r1, 115
LDI r2, 206
LDI r3, 54
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 187
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 40
LDI r11, 49
LDI r12, 32
LDI r13, 36
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
