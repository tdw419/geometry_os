; DESCRIPTION: Composite: Creates a cyan circular shape at (157, 66) with radius 56 then Places a black line segment connecting (421, 33) to (294, 35) then Sets a single red pixel at (76, 15).
; PLAN: r0=157(x), r1=66(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=421(x1), r6=33(y1), r7=294(x2), r8=35(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=15(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 157
LDI r1, 66
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 421
LDI r6, 33
LDI r7, 294
LDI r8, 35
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 15
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
