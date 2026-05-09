; DESCRIPTION: Composite: Places a black line segment connecting (161, 150) to (436, 46) then Creates a purple circular shape at (130, 85) with radius 78 then Places a cyan dot at position (97, 42).
; PLAN: r0=161(x1), r1=150(y1), r2=436(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=130(x), r6=85(y), r7=78(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=97(x), r11=42(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 161
LDI r1, 150
LDI r2, 436
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 85
LDI r7, 78
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 97
LDI r11, 42
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
