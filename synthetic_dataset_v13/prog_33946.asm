; DESCRIPTION: Composite: Places a cyan dot at position (17, 94) then Places a black circle of radius 58 at center (278, 61) then Draws a white line from (222, 66) to (100, 1).
; PLAN: r0=17(x), r1=94(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=278(x), r6=61(y), r7=58(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=222(x1), r11=66(y1), r12=100(x2), r13=1(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 17
LDI r1, 94
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 278
LDI r6, 61
LDI r7, 58
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 222
LDI r11, 66
LDI r12, 100
LDI r13, 1
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
