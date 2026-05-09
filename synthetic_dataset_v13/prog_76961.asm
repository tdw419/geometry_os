; DESCRIPTION: Composite: Places a yellow circle of radius 36 at center (202, 95) then Sets a single red pixel at (175, 41) then Draws a magenta rectangle at (456, 102) with width 25 and height 77.
; PLAN: r0=202(x), r1=95(y), r2=36(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=175(x), r6=41(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=456(x), r11=102(y), r12=25(width), r13=77(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 202
LDI r1, 95
LDI r2, 36
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 175
LDI r6, 41
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 456
LDI r11, 102
LDI r12, 25
LDI r13, 77
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
