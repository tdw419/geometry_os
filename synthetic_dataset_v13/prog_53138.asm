; DESCRIPTION: Composite: Places a red dot at position (280, 1) then Draws a white line from (430, 81) to (44, 0).
; PLAN: r0=280(x), r1=1(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=430(x1), r6=81(y1), r7=44(x2), r8=0(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 1
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 430
LDI r6, 81
LDI r7, 44
LDI r8, 0
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
