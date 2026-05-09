; DESCRIPTION: Composite: Draws a yellow circle centered at (401, 143) with radius 52 then Places a orange dot at position (334, 32) then Renders a black line between points (389, 250) and (436, 36).
; PLAN: r0=401(x), r1=143(y), r2=52(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=334(x), r6=32(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=389(x1), r11=250(y1), r12=436(x2), r13=36(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 143
LDI r2, 52
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 334
LDI r6, 32
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 389
LDI r11, 250
LDI r12, 436
LDI r13, 36
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
