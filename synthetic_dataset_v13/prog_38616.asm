; DESCRIPTION: Composite: Draws a yellow line from (76, 161) to (505, 178) then Draws a cyan circle centered at (48, 196) with radius 41 then Draws a yellow rectangle at (342, 64) with width 109 and height 62.
; PLAN: r0=76(x1), r1=161(y1), r2=505(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=48(x), r6=196(y), r7=41(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=342(x), r11=64(y), r12=109(width), r13=62(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 161
LDI r2, 505
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 48
LDI r6, 196
LDI r7, 41
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 342
LDI r11, 64
LDI r12, 109
LDI r13, 62
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
