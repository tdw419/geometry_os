; DESCRIPTION: Composite: Renders a purple line between points (196, 143) and (283, 39) then Draws a orange circle centered at (148, 86) with radius 32 then Places a red dot at position (490, 200).
; PLAN: r0=196(x1), r1=143(y1), r2=283(x2), r3=39(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=86(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x), r11=200(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 196
LDI r1, 143
LDI r2, 283
LDI r3, 39
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 86
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 200
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
