; DESCRIPTION: Composite: Renders a magenta line between points (368, 67) and (209, 14) then Creates a orange circular shape at (310, 105) with radius 49.
; PLAN: r0=368(x1), r1=67(y1), r2=209(x2), r3=14(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=105(y), r7=49(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 368
LDI r1, 67
LDI r2, 209
LDI r3, 14
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 105
LDI r7, 49
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
