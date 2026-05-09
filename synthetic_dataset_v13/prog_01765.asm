; DESCRIPTION: Composite: Renders a red line between points (364, 187) and (343, 129) then Creates a blue circular shape at (71, 129) with radius 51 then Places a green dot at position (280, 98).
; PLAN: r0=364(x1), r1=187(y1), r2=343(x2), r3=129(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=71(x), r6=129(y), r7=51(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=280(x), r11=98(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 187
LDI r2, 343
LDI r3, 129
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 71
LDI r6, 129
LDI r7, 51
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 280
LDI r11, 98
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
