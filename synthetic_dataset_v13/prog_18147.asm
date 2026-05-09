; DESCRIPTION: Composite: Renders a orange line between points (289, 27) and (347, 194) then Places a green circle of radius 37 at center (125, 42).
; PLAN: r0=289(x1), r1=27(y1), r2=347(x2), r3=194(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=125(x), r6=42(y), r7=37(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 27
LDI r2, 347
LDI r3, 194
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 42
LDI r7, 37
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
