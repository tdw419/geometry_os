; DESCRIPTION: Composite: Draws a orange line from (296, 197) to (53, 195) then Creates a yellow circular shape at (38, 222) with radius 28.
; PLAN: r0=296(x1), r1=197(y1), r2=53(x2), r3=195(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=38(x), r6=222(y), r7=28(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 296
LDI r1, 197
LDI r2, 53
LDI r3, 195
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 222
LDI r7, 28
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
