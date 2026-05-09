; DESCRIPTION: Composite: Draws a cyan line from (509, 48) to (50, 241) then Draws a black circle centered at (442, 125) with radius 56 then Sets a single white pixel at (495, 227).
; PLAN: r0=509(x1), r1=48(y1), r2=50(x2), r3=241(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=442(x), r6=125(y), r7=56(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=227(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 509
LDI r1, 48
LDI r2, 50
LDI r3, 241
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 442
LDI r6, 125
LDI r7, 56
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 227
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
