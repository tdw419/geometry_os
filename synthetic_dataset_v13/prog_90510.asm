; DESCRIPTION: Composite: Draws a orange line from (409, 7) to (440, 132) then Renders a white disk with center (374, 106) and radius 72 then Places a black dot at position (21, 78).
; PLAN: r0=409(x1), r1=7(y1), r2=440(x2), r3=132(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=106(y), r7=72(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=21(x), r11=78(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 7
LDI r2, 440
LDI r3, 132
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 106
LDI r7, 72
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 21
LDI r11, 78
LDI r12, 0x000000
PSET r10, r11, r12
HALT
