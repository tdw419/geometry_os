; DESCRIPTION: Composite: Draws a black rectangle at (386, 69) with width 81 and height 43 then Renders a purple line between points (3, 228) and (327, 53) then Draws a red circle centered at (114, 188) with radius 57.
; PLAN: r0=386(x), r1=69(y), r2=81(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x1), r6=228(y1), r7=327(x2), r8=53(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=114(x), r11=188(y), r12=57(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 386
LDI r1, 69
LDI r2, 81
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 228
LDI r7, 327
LDI r8, 53
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 114
LDI r11, 188
LDI r12, 57
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
