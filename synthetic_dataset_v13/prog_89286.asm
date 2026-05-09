; DESCRIPTION: Composite: Creates a white circular shape at (471, 177) with radius 14 then Places a cyan line segment connecting (117, 30) to (162, 197) then Sets a single yellow pixel at (167, 115).
; PLAN: r0=471(x), r1=177(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=117(x1), r6=30(y1), r7=162(x2), r8=197(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=115(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 471
LDI r1, 177
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 117
LDI r6, 30
LDI r7, 162
LDI r8, 197
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 115
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
