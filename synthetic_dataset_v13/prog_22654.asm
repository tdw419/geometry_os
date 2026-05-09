; DESCRIPTION: Composite: Renders a yellow box of size 25x114 starting at (357, 106) then Renders a orange line between points (299, 145) and (459, 204) then Places a magenta dot at position (194, 20).
; PLAN: r0=357(x), r1=106(y), r2=25(width), r3=114(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=299(x1), r6=145(y1), r7=459(x2), r8=204(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=194(x), r11=20(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 357
LDI r1, 106
LDI r2, 25
LDI r3, 114
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 299
LDI r6, 145
LDI r7, 459
LDI r8, 204
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 194
LDI r11, 20
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
