; DESCRIPTION: Composite: Places a orange line segment connecting (294, 90) to (217, 220) then Sets a single black pixel at (271, 216).
; PLAN: r0=294(x1), r1=90(y1), r2=217(x2), r3=220(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=216(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 294
LDI r1, 90
LDI r2, 217
LDI r3, 220
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 216
LDI r7, 0x000000
PSET r5, r6, r7
HALT
