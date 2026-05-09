; DESCRIPTION: Composite: Sets a single black pixel at (330, 10) then Renders a black disk with center (247, 61) and radius 33 then Draws a cyan line from (427, 174) to (261, 26).
; PLAN: r0=330(x), r1=10(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=247(x), r6=61(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=427(x1), r11=174(y1), r12=261(x2), r13=26(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 10
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 247
LDI r6, 61
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 427
LDI r11, 174
LDI r12, 261
LDI r13, 26
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
