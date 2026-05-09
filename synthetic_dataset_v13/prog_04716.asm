; DESCRIPTION: Composite: Sets a single red pixel at (53, 38) then Draws a magenta line from (445, 26) to (371, 73).
; PLAN: r0=53(x), r1=38(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=445(x1), r6=26(y1), r7=371(x2), r8=73(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 53
LDI r1, 38
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 445
LDI r6, 26
LDI r7, 371
LDI r8, 73
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
