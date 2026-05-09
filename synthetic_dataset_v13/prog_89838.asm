; DESCRIPTION: Composite: Places a orange dot at position (307, 7) then Renders a blue line between points (417, 66) and (375, 162).
; PLAN: r0=307(x), r1=7(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=417(x1), r6=66(y1), r7=375(x2), r8=162(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 307
LDI r1, 7
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 417
LDI r6, 66
LDI r7, 375
LDI r8, 162
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
