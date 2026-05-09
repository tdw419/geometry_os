; DESCRIPTION: Composite: Places a green line segment connecting (185, 7) to (14, 63) then Sets a single black pixel at (370, 172).
; PLAN: r0=185(x1), r1=7(y1), r2=14(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=370(x), r6=172(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 185
LDI r1, 7
LDI r2, 14
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 172
LDI r7, 0x000000
PSET r5, r6, r7
HALT
