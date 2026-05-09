; DESCRIPTION: Composite: Sets a single magenta pixel at (413, 184) then Draws a blue line from (370, 146) to (266, 115).
; PLAN: r0=413(x), r1=184(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=370(x1), r6=146(y1), r7=266(x2), r8=115(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 184
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 370
LDI r6, 146
LDI r7, 266
LDI r8, 115
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
