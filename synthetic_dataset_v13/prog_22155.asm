; DESCRIPTION: Composite: Places a magenta dot at position (251, 231) then Renders a orange line between points (292, 27) and (470, 30).
; PLAN: r0=251(x), r1=231(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=27(y1), r7=470(x2), r8=30(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 251
LDI r1, 231
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 27
LDI r7, 470
LDI r8, 30
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
