; DESCRIPTION: Composite: Places a orange dot at position (214, 44) then Draws a yellow line from (282, 44) to (340, 106) then Places a blue circle of radius 40 at center (239, 112).
; PLAN: r0=214(x), r1=44(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=44(y1), r7=340(x2), r8=106(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=239(x), r11=112(y), r12=40(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 214
LDI r1, 44
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 282
LDI r6, 44
LDI r7, 340
LDI r8, 106
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 239
LDI r11, 112
LDI r12, 40
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
