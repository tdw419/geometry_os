; DESCRIPTION: Composite: Draws a white line from (78, 96) to (105, 5) then Places a yellow dot at position (36, 173) then Creates a red circular shape at (327, 128) with radius 66.
; PLAN: r0=78(x1), r1=96(y1), r2=105(x2), r3=5(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=36(x), r6=173(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=128(y), r12=66(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 78
LDI r1, 96
LDI r2, 105
LDI r3, 5
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 36
LDI r6, 173
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 327
LDI r11, 128
LDI r12, 66
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
