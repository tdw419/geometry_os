; DESCRIPTION: Composite: Draws a black rectangle at (242, 111) with width 19 and height 48 then Draws a purple line from (360, 138) to (121, 220) then Draws a black circle centered at (149, 142) with radius 58.
; PLAN: r0=242(x), r1=111(y), r2=19(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x1), r6=138(y1), r7=121(x2), r8=220(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=149(x), r11=142(y), r12=58(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 111
LDI r2, 19
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 138
LDI r7, 121
LDI r8, 220
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 149
LDI r11, 142
LDI r12, 58
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
