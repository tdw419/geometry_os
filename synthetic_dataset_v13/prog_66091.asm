; DESCRIPTION: Composite: Draws a orange line from (39, 165) to (28, 194) then Sets a single green pixel at (496, 113) then Renders a cyan box of size 119x88 starting at (187, 66).
; PLAN: r0=39(x1), r1=165(y1), r2=28(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=496(x), r6=113(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=187(x), r11=66(y), r12=119(width), r13=88(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 165
LDI r2, 28
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 496
LDI r6, 113
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 187
LDI r11, 66
LDI r12, 119
LDI r13, 88
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
