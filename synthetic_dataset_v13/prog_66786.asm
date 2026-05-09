; DESCRIPTION: Composite: Places a red line segment connecting (77, 224) to (68, 9) then Sets a single white pixel at (40, 76).
; PLAN: r0=77(x1), r1=224(y1), r2=68(x2), r3=9(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=40(x), r6=76(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 77
LDI r1, 224
LDI r2, 68
LDI r3, 9
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 40
LDI r6, 76
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
