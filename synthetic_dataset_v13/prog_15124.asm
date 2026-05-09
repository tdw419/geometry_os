; DESCRIPTION: Composite: Draws a black line from (447, 255) to (257, 3) then Draws a cyan circle centered at (98, 73) with radius 59 then Sets a single yellow pixel at (223, 176).
; PLAN: r0=447(x1), r1=255(y1), r2=257(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=98(x), r6=73(y), r7=59(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=223(x), r11=176(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 447
LDI r1, 255
LDI r2, 257
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 73
LDI r7, 59
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 223
LDI r11, 176
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
