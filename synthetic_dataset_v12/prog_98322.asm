; DESCRIPTION: Composite: Draws a yellow line from (241, 88) to (73, 18) then Renders a black disk with center (339, 41) and radius 28 then Places a orange 31x27 rectangle at position (231, 9).
; PLAN: r0=241(x1), r1=88(y1), r2=73(x2), r3=18(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=339(x), r6=41(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=9(y), r12=31(width), r13=27(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 88
LDI r2, 73
LDI r3, 18
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 339
LDI r6, 41
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 9
LDI r12, 31
LDI r13, 27
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
