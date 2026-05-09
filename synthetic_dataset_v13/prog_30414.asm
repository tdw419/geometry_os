; DESCRIPTION: Composite: Creates a red circular shape at (218, 160) with radius 75 then Places a black line segment connecting (76, 66) to (25, 42) then Places a black dot at position (51, 137).
; PLAN: r0=218(x), r1=160(y), r2=75(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=76(x1), r6=66(y1), r7=25(x2), r8=42(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=51(x), r11=137(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 218
LDI r1, 160
LDI r2, 75
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 76
LDI r6, 66
LDI r7, 25
LDI r8, 42
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 51
LDI r11, 137
LDI r12, 0x000000
PSET r10, r11, r12
HALT
