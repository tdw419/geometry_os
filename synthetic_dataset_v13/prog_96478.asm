; DESCRIPTION: Composite: Places a red line segment connecting (280, 17) to (364, 174) then Places a blue dot at position (316, 27).
; PLAN: r0=280(x1), r1=17(y1), r2=364(x2), r3=174(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=316(x), r6=27(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 280
LDI r1, 17
LDI r2, 364
LDI r3, 174
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 27
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
