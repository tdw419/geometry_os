; DESCRIPTION: Composite: Draws a yellow circle centered at (255, 177) with radius 58 then Draws a orange line from (237, 184) to (405, 54) then Places a white dot at position (211, 2).
; PLAN: r0=255(x), r1=177(y), r2=58(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x1), r6=184(y1), r7=405(x2), r8=54(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=211(x), r11=2(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 177
LDI r2, 58
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 184
LDI r7, 405
LDI r8, 54
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 211
LDI r11, 2
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
