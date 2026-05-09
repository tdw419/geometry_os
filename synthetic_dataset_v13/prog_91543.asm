; DESCRIPTION: Composite: Draws a yellow rectangle at (242, 95) with width 31 and height 20 then Places a red dot at position (345, 232) then Draws a orange line from (230, 121) to (474, 78).
; PLAN: r0=242(x), r1=95(y), r2=31(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x), r6=232(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=230(x1), r11=121(y1), r12=474(x2), r13=78(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 242
LDI r1, 95
LDI r2, 31
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 232
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 230
LDI r11, 121
LDI r12, 474
LDI r13, 78
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
