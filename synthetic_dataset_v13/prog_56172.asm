; DESCRIPTION: Composite: Places a purple dot at position (30, 35) then Draws a green line from (301, 75) to (334, 121).
; PLAN: r0=30(x), r1=35(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=301(x1), r6=75(y1), r7=334(x2), r8=121(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 30
LDI r1, 35
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 301
LDI r6, 75
LDI r7, 334
LDI r8, 121
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
