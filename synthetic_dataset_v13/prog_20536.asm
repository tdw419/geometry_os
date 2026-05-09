; DESCRIPTION: Composite: Renders a red line between points (257, 16) and (476, 9) then Creates a cyan circular shape at (227, 112) with radius 55.
; PLAN: r0=257(x1), r1=16(y1), r2=476(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=227(x), r6=112(y), r7=55(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 257
LDI r1, 16
LDI r2, 476
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 112
LDI r7, 55
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
