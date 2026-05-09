; DESCRIPTION: Composite: Draws a yellow rectangle at (59, 64) with width 88 and height 54 then Draws a cyan line from (247, 204) to (37, 141) then Draws a blue circle centered at (338, 105) with radius 43.
; PLAN: r0=59(x), r1=64(y), r2=88(width), r3=54(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=247(x1), r6=204(y1), r7=37(x2), r8=141(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=338(x), r11=105(y), r12=43(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 64
LDI r2, 88
LDI r3, 54
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 247
LDI r6, 204
LDI r7, 37
LDI r8, 141
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 338
LDI r11, 105
LDI r12, 43
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
