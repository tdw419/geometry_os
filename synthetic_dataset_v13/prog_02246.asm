; DESCRIPTION: Composite: Renders a white line between points (396, 34) and (11, 60) then Places a white dot at position (42, 228) then Places a yellow circle of radius 19 at center (376, 52).
; PLAN: r0=396(x1), r1=34(y1), r2=11(x2), r3=60(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=42(x), r6=228(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=376(x), r11=52(y), r12=19(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 396
LDI r1, 34
LDI r2, 11
LDI r3, 60
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 42
LDI r6, 228
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 376
LDI r11, 52
LDI r12, 19
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
