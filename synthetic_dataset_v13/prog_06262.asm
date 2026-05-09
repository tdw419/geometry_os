; DESCRIPTION: Composite: Renders a white disk with center (37, 138) and radius 18 then Renders a white line between points (120, 128) and (481, 90) then Places a cyan dot at position (325, 87).
; PLAN: r0=37(x), r1=138(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=128(y1), r7=481(x2), r8=90(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=325(x), r11=87(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 37
LDI r1, 138
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 128
LDI r7, 481
LDI r8, 90
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 325
LDI r11, 87
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
