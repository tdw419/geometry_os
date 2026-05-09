; DESCRIPTION: Composite: Places a orange dot at position (435, 28) then Draws a red line from (57, 5) to (361, 25).
; PLAN: r0=435(x), r1=28(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=57(x1), r6=5(y1), r7=361(x2), r8=25(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 28
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 57
LDI r6, 5
LDI r7, 361
LDI r8, 25
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
