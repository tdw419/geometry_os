; DESCRIPTION: Composite: Places a cyan line segment connecting (225, 159) to (211, 97) then Creates a magenta circular shape at (399, 77) with radius 30 then Places a cyan dot at position (143, 148).
; PLAN: r0=225(x1), r1=159(y1), r2=211(x2), r3=97(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=399(x), r6=77(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=143(x), r11=148(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 225
LDI r1, 159
LDI r2, 211
LDI r3, 97
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 399
LDI r6, 77
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 143
LDI r11, 148
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
