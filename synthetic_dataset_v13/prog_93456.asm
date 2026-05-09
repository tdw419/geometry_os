; DESCRIPTION: Composite: Sets a single red pixel at (268, 5) then Places a white line segment connecting (495, 187) to (214, 53).
; PLAN: r0=268(x), r1=5(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=495(x1), r6=187(y1), r7=214(x2), r8=53(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 268
LDI r1, 5
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 495
LDI r6, 187
LDI r7, 214
LDI r8, 53
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
