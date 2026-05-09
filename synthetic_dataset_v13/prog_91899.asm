; DESCRIPTION: Composite: Creates a orange circular shape at (192, 77) with radius 39 then Draws a cyan line from (389, 117) to (460, 107) then Places a red dot at position (461, 201).
; PLAN: r0=192(x), r1=77(y), r2=39(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=389(x1), r6=117(y1), r7=460(x2), r8=107(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=461(x), r11=201(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 77
LDI r2, 39
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 389
LDI r6, 117
LDI r7, 460
LDI r8, 107
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 461
LDI r11, 201
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
