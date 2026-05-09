; DESCRIPTION: Composite: Creates a green circular shape at (440, 191) with radius 55 then Renders a orange line between points (109, 94) and (176, 205) then Sets a single black pixel at (333, 69).
; PLAN: r0=440(x), r1=191(y), r2=55(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x1), r6=94(y1), r7=176(x2), r8=205(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=333(x), r11=69(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 440
LDI r1, 191
LDI r2, 55
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 94
LDI r7, 176
LDI r8, 205
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 333
LDI r11, 69
LDI r12, 0x000000
PSET r10, r11, r12
HALT
