; DESCRIPTION: Composite: Draws a white circle centered at (49, 100) with radius 47 then Draws a black line from (491, 44) to (238, 252) then Places a purple dot at position (491, 220).
; PLAN: r0=49(x), r1=100(y), r2=47(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=491(x1), r6=44(y1), r7=238(x2), r8=252(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=491(x), r11=220(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 49
LDI r1, 100
LDI r2, 47
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 491
LDI r6, 44
LDI r7, 238
LDI r8, 252
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 491
LDI r11, 220
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
