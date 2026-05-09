; DESCRIPTION: Composite: Draws a orange line from (330, 149) to (151, 64) then Draws a orange circle centered at (72, 175) with radius 37.
; PLAN: r0=330(x1), r1=149(y1), r2=151(x2), r3=64(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=72(x), r6=175(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 330
LDI r1, 149
LDI r2, 151
LDI r3, 64
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 175
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
