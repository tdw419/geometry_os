; DESCRIPTION: Composite: Places a red dot at position (384, 60) then Draws a black line from (389, 6) to (317, 47).
; PLAN: r0=384(x), r1=60(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=389(x1), r6=6(y1), r7=317(x2), r8=47(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 384
LDI r1, 60
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 389
LDI r6, 6
LDI r7, 317
LDI r8, 47
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
