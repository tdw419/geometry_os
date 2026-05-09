; DESCRIPTION: Composite: Sets a single black pixel at (440, 115) then Draws a orange circle centered at (299, 117) with radius 44 then Places a blue line segment connecting (355, 93) to (409, 246).
; PLAN: r0=440(x), r1=115(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=299(x), r6=117(y), r7=44(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x1), r11=93(y1), r12=409(x2), r13=246(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 115
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 299
LDI r6, 117
LDI r7, 44
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 93
LDI r12, 409
LDI r13, 246
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
