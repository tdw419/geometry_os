; DESCRIPTION: Composite: Places a white dot at position (399, 112) then Renders a red line between points (66, 231) and (96, 236).
; PLAN: r0=399(x), r1=112(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=66(x1), r6=231(y1), r7=96(x2), r8=236(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 112
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 66
LDI r6, 231
LDI r7, 96
LDI r8, 236
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
