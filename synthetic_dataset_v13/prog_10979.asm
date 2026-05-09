; DESCRIPTION: Composite: Draws a yellow circle centered at (356, 137) with radius 78 then Renders a magenta box of size 41x79 starting at (159, 29).
; PLAN: r0=356(x), r1=137(y), r2=78(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=29(y), r7=41(width), r8=79(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 137
LDI r2, 78
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 29
LDI r7, 41
LDI r8, 79
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
