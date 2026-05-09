; DESCRIPTION: Composite: Sets a single white pixel at (18, 118) then Draws a white line from (49, 161) to (308, 220).
; PLAN: r0=18(x), r1=118(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=161(y1), r7=308(x2), r8=220(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 18
LDI r1, 118
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 49
LDI r6, 161
LDI r7, 308
LDI r8, 220
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
