; DESCRIPTION: Composite: Places a white line segment connecting (298, 132) to (198, 49) then Places a blue dot at position (56, 245) then Renders a white disk with center (261, 54) and radius 45.
; PLAN: r0=298(x1), r1=132(y1), r2=198(x2), r3=49(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=56(x), r6=245(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=261(x), r11=54(y), r12=45(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 298
LDI r1, 132
LDI r2, 198
LDI r3, 49
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 56
LDI r6, 245
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 261
LDI r11, 54
LDI r12, 45
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
