; DESCRIPTION: Composite: Sets a single red pixel at (55, 124) then Places a white line segment connecting (356, 170) to (281, 103).
; PLAN: r0=55(x), r1=124(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=356(x1), r6=170(y1), r7=281(x2), r8=103(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 124
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 356
LDI r6, 170
LDI r7, 281
LDI r8, 103
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
