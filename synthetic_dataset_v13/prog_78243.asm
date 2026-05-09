; DESCRIPTION: Composite: Places a white dot at position (423, 195) then Draws a yellow line from (73, 25) to (280, 52).
; PLAN: r0=423(x), r1=195(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=73(x1), r6=25(y1), r7=280(x2), r8=52(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 195
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 25
LDI r7, 280
LDI r8, 52
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
