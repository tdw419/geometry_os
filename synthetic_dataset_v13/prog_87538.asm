; DESCRIPTION: Composite: Draws a cyan line from (87, 49) to (481, 155) then Draws a blue rectangle at (86, 88) with width 18 and height 57 then Places a yellow circle of radius 31 at center (213, 209).
; PLAN: r0=87(x1), r1=49(y1), r2=481(x2), r3=155(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=88(y), r7=18(width), r8=57(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=213(x), r11=209(y), r12=31(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 87
LDI r1, 49
LDI r2, 481
LDI r3, 155
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 88
LDI r7, 18
LDI r8, 57
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 213
LDI r11, 209
LDI r12, 31
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
