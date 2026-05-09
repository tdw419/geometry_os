; DESCRIPTION: Composite: Sets a single black pixel at (348, 41) then Draws a magenta circle centered at (232, 120) with radius 57 then Draws a yellow line from (281, 222) to (404, 203).
; PLAN: r0=348(x), r1=41(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=120(y), r7=57(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x1), r11=222(y1), r12=404(x2), r13=203(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 348
LDI r1, 41
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 232
LDI r6, 120
LDI r7, 57
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 222
LDI r12, 404
LDI r13, 203
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
