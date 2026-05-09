; DESCRIPTION: Composite: Renders a magenta line between points (422, 132) and (409, 229) then Draws a black circle centered at (425, 105) with radius 49 then Places a cyan dot at position (497, 69).
; PLAN: r0=422(x1), r1=132(y1), r2=409(x2), r3=229(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=425(x), r6=105(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=497(x), r11=69(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 422
LDI r1, 132
LDI r2, 409
LDI r3, 229
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 105
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 497
LDI r11, 69
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
