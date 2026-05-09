; DESCRIPTION: Composite: Places a yellow line segment connecting (454, 71) to (276, 252) then Sets a single cyan pixel at (414, 166).
; PLAN: r0=454(x1), r1=71(y1), r2=276(x2), r3=252(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=414(x), r6=166(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 454
LDI r1, 71
LDI r2, 276
LDI r3, 252
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 414
LDI r6, 166
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
