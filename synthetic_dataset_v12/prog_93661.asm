; DESCRIPTION: Composite: Sets a single white pixel at (262, 115) then Places a white line segment connecting (246, 231) to (205, 8).
; PLAN: r0=262(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=246(x1), r6=231(y1), r7=205(x2), r8=8(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 246
LDI r6, 231
LDI r7, 205
LDI r8, 8
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
