; DESCRIPTION: Composite: Renders a white line between points (344, 162) and (124, 160) then Creates a black circular shape at (108, 195) with radius 28 then Places a yellow dot at position (460, 76).
; PLAN: r0=344(x1), r1=162(y1), r2=124(x2), r3=160(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=195(y), r7=28(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=460(x), r11=76(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 162
LDI r2, 124
LDI r3, 160
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 195
LDI r7, 28
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 460
LDI r11, 76
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
