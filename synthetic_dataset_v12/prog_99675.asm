; DESCRIPTION: Composite: Places a purple circle of radius 47 at center (447, 50) then Renders a black line between points (32, 99) and (409, 240) then Places a black dot at position (449, 25).
; PLAN: r0=447(x), r1=50(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=32(x1), r6=99(y1), r7=409(x2), r8=240(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=449(x), r11=25(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 50
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 32
LDI r6, 99
LDI r7, 409
LDI r8, 240
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 449
LDI r11, 25
LDI r12, 0x000000
PSET r10, r11, r12
HALT
