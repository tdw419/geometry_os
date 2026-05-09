; DESCRIPTION: Composite: Creates a blue circular shape at (62, 97) with radius 36 then Draws a yellow rectangle at (231, 164) with width 24 and height 39 then Draws a cyan line from (166, 125) to (43, 16).
; PLAN: r0=62(x), r1=97(y), r2=36(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=164(y), r7=24(width), r8=39(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=166(x1), r11=125(y1), r12=43(x2), r13=16(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 62
LDI r1, 97
LDI r2, 36
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 164
LDI r7, 24
LDI r8, 39
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 166
LDI r11, 125
LDI r12, 43
LDI r13, 16
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
