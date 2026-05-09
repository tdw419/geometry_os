; DESCRIPTION: Composite: Draws a blue line from (426, 157) to (25, 66) then Renders a orange disk with center (395, 56) and radius 24 then Places a black dot at position (365, 244).
; PLAN: r0=426(x1), r1=157(y1), r2=25(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=395(x), r6=56(y), r7=24(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=244(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 157
LDI r2, 25
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 395
LDI r6, 56
LDI r7, 24
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 244
LDI r12, 0x000000
PSET r10, r11, r12
HALT
