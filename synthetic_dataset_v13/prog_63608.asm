; DESCRIPTION: Composite: Places a cyan dot at position (199, 247) then Draws a orange line from (344, 211) to (81, 134).
; PLAN: r0=199(x), r1=247(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=344(x1), r6=211(y1), r7=81(x2), r8=134(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 199
LDI r1, 247
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 344
LDI r6, 211
LDI r7, 81
LDI r8, 134
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
