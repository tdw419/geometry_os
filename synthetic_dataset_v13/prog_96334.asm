; DESCRIPTION: Composite: Places a magenta circle of radius 78 at center (309, 149) then Places a yellow dot at position (460, 12) then Places a orange line segment connecting (68, 187) to (385, 128).
; PLAN: r0=309(x), r1=149(y), r2=78(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x), r6=12(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=68(x1), r11=187(y1), r12=385(x2), r13=128(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 149
LDI r2, 78
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 12
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 68
LDI r11, 187
LDI r12, 385
LDI r13, 128
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
