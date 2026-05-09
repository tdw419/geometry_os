; DESCRIPTION: Composite: Sets a single magenta pixel at (58, 38) then Draws a white line from (294, 164) to (458, 181).
; PLAN: r0=58(x), r1=38(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=294(x1), r6=164(y1), r7=458(x2), r8=181(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 58
LDI r1, 38
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 294
LDI r6, 164
LDI r7, 458
LDI r8, 181
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
