; DESCRIPTION: Composite: Renders a orange line between points (75, 154) and (228, 33) then Creates a red circular shape at (285, 207) with radius 24 then Sets a single red pixel at (217, 110).
; PLAN: r0=75(x1), r1=154(y1), r2=228(x2), r3=33(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=285(x), r6=207(y), r7=24(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=217(x), r11=110(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 75
LDI r1, 154
LDI r2, 228
LDI r3, 33
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 207
LDI r7, 24
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 217
LDI r11, 110
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
