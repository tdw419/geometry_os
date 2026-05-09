; DESCRIPTION: Composite: Draws a white line from (289, 240) to (385, 121) then Creates a cyan circular shape at (422, 144) with radius 77 then Places a purple dot at position (101, 56).
; PLAN: r0=289(x1), r1=240(y1), r2=385(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=144(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x), r11=56(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 240
LDI r2, 385
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 144
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 56
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
