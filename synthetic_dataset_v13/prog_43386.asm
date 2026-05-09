; DESCRIPTION: Composite: Places a magenta line segment connecting (419, 252) to (351, 243) then Renders a orange disk with center (213, 104) and radius 69 then Sets a single white pixel at (292, 38).
; PLAN: r0=419(x1), r1=252(y1), r2=351(x2), r3=243(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=213(x), r6=104(y), r7=69(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=292(x), r11=38(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 419
LDI r1, 252
LDI r2, 351
LDI r3, 243
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 213
LDI r6, 104
LDI r7, 69
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 292
LDI r11, 38
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
