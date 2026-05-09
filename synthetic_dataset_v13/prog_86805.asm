; DESCRIPTION: Composite: Renders a cyan line between points (156, 46) and (225, 177) then Renders a black disk with center (288, 118) and radius 14 then Places a green dot at position (386, 45).
; PLAN: r0=156(x1), r1=46(y1), r2=225(x2), r3=177(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=118(y), r7=14(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=45(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 46
LDI r2, 225
LDI r3, 177
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 118
LDI r7, 14
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 45
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
