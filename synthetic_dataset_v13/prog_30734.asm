; DESCRIPTION: Composite: Draws a yellow circle centered at (127, 157) with radius 35 then Places a red 106x31 rectangle at position (286, 51) then Draws a yellow line from (164, 216) to (384, 22).
; PLAN: r0=127(x), r1=157(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=286(x), r6=51(y), r7=106(width), r8=31(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x1), r11=216(y1), r12=384(x2), r13=22(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 127
LDI r1, 157
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 286
LDI r6, 51
LDI r7, 106
LDI r8, 31
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 216
LDI r12, 384
LDI r13, 22
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
