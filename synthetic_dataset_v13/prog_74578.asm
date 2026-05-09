; DESCRIPTION: Composite: Renders a white disk with center (42, 77) and radius 19 then Renders a red line between points (27, 183) and (354, 60) then Sets a single orange pixel at (178, 10).
; PLAN: r0=42(x), r1=77(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x1), r6=183(y1), r7=354(x2), r8=60(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=10(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 42
LDI r1, 77
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 183
LDI r7, 354
LDI r8, 60
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 10
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
