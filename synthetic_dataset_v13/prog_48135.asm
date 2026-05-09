; DESCRIPTION: Composite: Creates a yellow circular shape at (289, 83) with radius 13 then Draws a red line from (257, 38) to (286, 17) then Sets a single orange pixel at (323, 42).
; PLAN: r0=289(x), r1=83(y), r2=13(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x1), r6=38(y1), r7=286(x2), r8=17(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=42(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 289
LDI r1, 83
LDI r2, 13
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 38
LDI r7, 286
LDI r8, 17
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 42
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
