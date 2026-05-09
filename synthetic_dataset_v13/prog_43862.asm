; DESCRIPTION: Composite: Draws a white line from (421, 5) to (307, 19) then Places a yellow dot at position (430, 128) then Places a white circle of radius 13 at center (20, 127).
; PLAN: r0=421(x1), r1=5(y1), r2=307(x2), r3=19(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=430(x), r6=128(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=20(x), r11=127(y), r12=13(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 421
LDI r1, 5
LDI r2, 307
LDI r3, 19
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 430
LDI r6, 128
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 20
LDI r11, 127
LDI r12, 13
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
