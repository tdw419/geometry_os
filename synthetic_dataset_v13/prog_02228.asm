; DESCRIPTION: Composite: Renders a green box of size 105x41 starting at (229, 73) then Sets a single black pixel at (10, 37) then Renders a yellow disk with center (123, 50) and radius 21.
; PLAN: r0=229(x), r1=73(y), r2=105(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x), r6=37(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=123(x), r11=50(y), r12=21(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 229
LDI r1, 73
LDI r2, 105
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 37
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 123
LDI r11, 50
LDI r12, 21
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
