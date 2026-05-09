; DESCRIPTION: Composite: Draws a orange line from (376, 2) to (131, 12) then Creates a yellow circular shape at (330, 164) with radius 17 then Draws a cyan rectangle at (27, 83) with width 59 and height 89.
; PLAN: r0=376(x1), r1=2(y1), r2=131(x2), r3=12(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=330(x), r6=164(y), r7=17(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=27(x), r11=83(y), r12=59(width), r13=89(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 2
LDI r2, 131
LDI r3, 12
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 330
LDI r6, 164
LDI r7, 17
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 27
LDI r11, 83
LDI r12, 59
LDI r13, 89
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
