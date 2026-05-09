; DESCRIPTION: Composite: Places a white dot at position (343, 85) then Renders a magenta line between points (156, 19) and (306, 213).
; PLAN: r0=343(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=156(x1), r6=19(y1), r7=306(x2), r8=213(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 343
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 156
LDI r6, 19
LDI r7, 306
LDI r8, 213
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
