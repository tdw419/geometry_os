; DESCRIPTION: Composite: Places a black dot at position (214, 116) then Draws a green line from (318, 191) to (65, 175).
; PLAN: r0=214(x), r1=116(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=318(x1), r6=191(y1), r7=65(x2), r8=175(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 116
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 318
LDI r6, 191
LDI r7, 65
LDI r8, 175
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
