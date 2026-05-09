; DESCRIPTION: Composite: Draws a orange line from (203, 119) to (386, 192) then Creates a red circular shape at (409, 76) with radius 40 then Sets a single white pixel at (387, 240).
; PLAN: r0=203(x1), r1=119(y1), r2=386(x2), r3=192(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=76(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=387(x), r11=240(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 203
LDI r1, 119
LDI r2, 386
LDI r3, 192
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 76
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 387
LDI r11, 240
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
