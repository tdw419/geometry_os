; DESCRIPTION: Composite: Draws a white line from (109, 88) to (465, 108) then Creates a orange circular shape at (215, 160) with radius 35 then Places a cyan dot at position (426, 147).
; PLAN: r0=109(x1), r1=88(y1), r2=465(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=215(x), r6=160(y), r7=35(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=426(x), r11=147(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 109
LDI r1, 88
LDI r2, 465
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 215
LDI r6, 160
LDI r7, 35
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 426
LDI r11, 147
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
