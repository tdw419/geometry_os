; DESCRIPTION: Composite: Places a white dot at position (453, 86) then Draws a red line from (80, 6) to (223, 103).
; PLAN: r0=453(x), r1=86(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=80(x1), r6=6(y1), r7=223(x2), r8=103(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 86
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 80
LDI r6, 6
LDI r7, 223
LDI r8, 103
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
