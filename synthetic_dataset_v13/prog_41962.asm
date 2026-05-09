; DESCRIPTION: Composite: Sets a single green pixel at (125, 211) then Creates a black circular shape at (421, 163) with radius 74 then Draws a cyan line from (45, 162) to (174, 47).
; PLAN: r0=125(x), r1=211(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=421(x), r6=163(y), r7=74(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=45(x1), r11=162(y1), r12=174(x2), r13=47(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 211
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 421
LDI r6, 163
LDI r7, 74
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 45
LDI r11, 162
LDI r12, 174
LDI r13, 47
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
