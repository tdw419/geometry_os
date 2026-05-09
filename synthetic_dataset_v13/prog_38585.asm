; DESCRIPTION: Composite: Places a red line segment connecting (165, 7) to (355, 2) then Places a magenta dot at position (96, 95).
; PLAN: r0=165(x1), r1=7(y1), r2=355(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=96(x), r6=95(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 165
LDI r1, 7
LDI r2, 355
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 95
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
