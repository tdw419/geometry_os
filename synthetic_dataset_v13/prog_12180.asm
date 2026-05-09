; DESCRIPTION: Composite: Creates a orange circular shape at (347, 69) with radius 32 then Places a green line segment connecting (180, 112) to (475, 97) then Sets a single yellow pixel at (100, 71).
; PLAN: r0=347(x), r1=69(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=180(x1), r6=112(y1), r7=475(x2), r8=97(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=71(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 347
LDI r1, 69
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 180
LDI r6, 112
LDI r7, 475
LDI r8, 97
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 71
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
