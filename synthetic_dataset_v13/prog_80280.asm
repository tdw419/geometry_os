; DESCRIPTION: Composite: Draws a blue circle centered at (340, 68) with radius 45 then Sets a single red pixel at (32, 24) then Places a black line segment connecting (104, 128) to (365, 228).
; PLAN: r0=340(x), r1=68(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x), r6=24(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=104(x1), r11=128(y1), r12=365(x2), r13=228(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 68
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 24
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 104
LDI r11, 128
LDI r12, 365
LDI r13, 228
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
