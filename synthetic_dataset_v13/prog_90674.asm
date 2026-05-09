; DESCRIPTION: Composite: Renders a black disk with center (416, 51) and radius 50 then Places a yellow dot at position (279, 30) then Places a orange line segment connecting (294, 8) to (176, 122).
; PLAN: r0=416(x), r1=51(y), r2=50(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=30(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=294(x1), r11=8(y1), r12=176(x2), r13=122(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 51
LDI r2, 50
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 30
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 294
LDI r11, 8
LDI r12, 176
LDI r13, 122
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
