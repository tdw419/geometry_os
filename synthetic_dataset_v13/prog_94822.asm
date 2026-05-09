; DESCRIPTION: Composite: Sets a single blue pixel at (99, 134) then Places a black line segment connecting (473, 104) to (224, 227).
; PLAN: r0=99(x), r1=134(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=473(x1), r6=104(y1), r7=224(x2), r8=227(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 99
LDI r1, 134
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 473
LDI r6, 104
LDI r7, 224
LDI r8, 227
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
