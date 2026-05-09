; DESCRIPTION: Composite: Places a blue dot at position (138, 191) then Places a white line segment connecting (331, 169) to (43, 61).
; PLAN: r0=138(x), r1=191(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=331(x1), r6=169(y1), r7=43(x2), r8=61(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 191
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 331
LDI r6, 169
LDI r7, 43
LDI r8, 61
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
