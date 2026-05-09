; DESCRIPTION: Composite: Places a white dot at position (36, 7) then Draws a red line from (161, 59) to (26, 40).
; PLAN: r0=36(x), r1=7(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=59(y1), r7=26(x2), r8=40(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 36
LDI r1, 7
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 59
LDI r7, 26
LDI r8, 40
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
