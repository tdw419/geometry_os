; DESCRIPTION: Composite: Renders a red line between points (196, 228) and (204, 99) then Renders a yellow box of size 29x99 starting at (460, 77) then Creates a orange circular shape at (219, 119) with radius 44.
; PLAN: r0=196(x1), r1=228(y1), r2=204(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=460(x), r6=77(y), r7=29(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x), r11=119(y), r12=44(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 196
LDI r1, 228
LDI r2, 204
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 460
LDI r6, 77
LDI r7, 29
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 119
LDI r12, 44
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
