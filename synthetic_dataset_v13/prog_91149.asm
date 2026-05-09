; DESCRIPTION: Composite: Draws a orange line from (65, 197) to (286, 225) then Places a yellow dot at position (385, 200) then Places a red 101x88 rectangle at position (266, 74).
; PLAN: r0=65(x1), r1=197(y1), r2=286(x2), r3=225(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=385(x), r6=200(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=266(x), r11=74(y), r12=101(width), r13=88(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 65
LDI r1, 197
LDI r2, 286
LDI r3, 225
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 200
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 266
LDI r11, 74
LDI r12, 101
LDI r13, 88
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
