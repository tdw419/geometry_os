; DESCRIPTION: Composite: Draws a orange circle centered at (50, 191) with radius 19 then Places a white line segment connecting (350, 36) to (291, 101) then Places a red dot at position (354, 53).
; PLAN: r0=50(x), r1=191(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=350(x1), r6=36(y1), r7=291(x2), r8=101(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=354(x), r11=53(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 50
LDI r1, 191
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 350
LDI r6, 36
LDI r7, 291
LDI r8, 101
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 53
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
