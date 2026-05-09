; DESCRIPTION: Composite: Draws a white line from (381, 239) to (506, 113) then Renders a white disk with center (307, 44) and radius 26 then Sets a single yellow pixel at (86, 142).
; PLAN: r0=381(x1), r1=239(y1), r2=506(x2), r3=113(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=44(y), r7=26(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=86(x), r11=142(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 381
LDI r1, 239
LDI r2, 506
LDI r3, 113
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 44
LDI r7, 26
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 86
LDI r11, 142
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
