; DESCRIPTION: Composite: Places a purple dot at position (184, 49) then Draws a blue line from (223, 101) to (458, 34).
; PLAN: r0=184(x), r1=49(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=223(x1), r6=101(y1), r7=458(x2), r8=34(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 49
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 223
LDI r6, 101
LDI r7, 458
LDI r8, 34
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
