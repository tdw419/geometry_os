; DESCRIPTION: Composite: Sets a single red pixel at (397, 96) then Renders a white line between points (25, 37) and (158, 56).
; PLAN: r0=397(x), r1=96(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=37(y1), r7=158(x2), r8=56(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 397
LDI r1, 96
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 25
LDI r6, 37
LDI r7, 158
LDI r8, 56
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
