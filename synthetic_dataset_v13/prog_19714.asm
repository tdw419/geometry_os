; DESCRIPTION: Composite: Sets a single purple pixel at (393, 5) then Draws a white line from (382, 133) to (103, 212).
; PLAN: r0=393(x), r1=5(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=382(x1), r6=133(y1), r7=103(x2), r8=212(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 5
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 382
LDI r6, 133
LDI r7, 103
LDI r8, 212
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
