; DESCRIPTION: Composite: Places a white line segment connecting (76, 31) to (428, 22) then Places a red dot at position (440, 217).
; PLAN: r0=76(x1), r1=31(y1), r2=428(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=217(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 76
LDI r1, 31
LDI r2, 428
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 217
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
