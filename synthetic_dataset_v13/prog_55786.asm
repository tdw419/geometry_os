; DESCRIPTION: Composite: Places a white circle of radius 37 at center (308, 194) then Renders a black line between points (354, 189) and (257, 89).
; PLAN: r0=308(x), r1=194(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=354(x1), r6=189(y1), r7=257(x2), r8=89(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 194
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 354
LDI r6, 189
LDI r7, 257
LDI r8, 89
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
