; DESCRIPTION: Composite: Creates a orange circular shape at (444, 134) with radius 30 then Sets a single green pixel at (99, 172) then Renders a white line between points (301, 113) and (73, 43).
; PLAN: r0=444(x), r1=134(y), r2=30(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=99(x), r6=172(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=301(x1), r11=113(y1), r12=73(x2), r13=43(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 444
LDI r1, 134
LDI r2, 30
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 99
LDI r6, 172
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 301
LDI r11, 113
LDI r12, 73
LDI r13, 43
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
