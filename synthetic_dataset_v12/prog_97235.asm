; DESCRIPTION: Composite: Draws a blue circle centered at (198, 91) with radius 75 then Places a white dot at position (94, 86).
; PLAN: r0=198(x), r1=91(y), r2=75(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=86(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 198
LDI r1, 91
LDI r2, 75
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 86
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
