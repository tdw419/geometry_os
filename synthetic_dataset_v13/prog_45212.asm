; DESCRIPTION: Composite: Draws a red line from (272, 241) to (333, 248) then Draws a yellow circle centered at (86, 102) with radius 69 then Draws a cyan rectangle at (37, 151) with width 105 and height 10.
; PLAN: r0=272(x1), r1=241(y1), r2=333(x2), r3=248(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=86(x), r6=102(y), r7=69(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=37(x), r11=151(y), r12=105(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 241
LDI r2, 333
LDI r3, 248
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 102
LDI r7, 69
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 37
LDI r11, 151
LDI r12, 105
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
