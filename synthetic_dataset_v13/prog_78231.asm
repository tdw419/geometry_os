; DESCRIPTION: Composite: Places a red line segment connecting (480, 34) to (9, 187) then Creates a red circular shape at (443, 98) with radius 64 then Places a purple dot at position (43, 250).
; PLAN: r0=480(x1), r1=34(y1), r2=9(x2), r3=187(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=443(x), r6=98(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=250(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 480
LDI r1, 34
LDI r2, 9
LDI r3, 187
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 443
LDI r6, 98
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 250
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
