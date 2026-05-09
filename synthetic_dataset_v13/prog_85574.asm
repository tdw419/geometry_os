; DESCRIPTION: Composite: Places a black 31x120 rectangle at position (299, 11) then Renders a yellow disk with center (378, 200) and radius 26 then Places a white dot at position (68, 31).
; PLAN: r0=299(x), r1=11(y), r2=31(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=200(y), r7=26(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=31(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 11
LDI r2, 31
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 200
LDI r7, 26
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 31
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
