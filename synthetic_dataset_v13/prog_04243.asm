; DESCRIPTION: Composite: Sets a single cyan pixel at (166, 148) then Draws a green line from (107, 86) to (345, 134).
; PLAN: r0=166(x), r1=148(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=107(x1), r6=86(y1), r7=345(x2), r8=134(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 166
LDI r1, 148
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 107
LDI r6, 86
LDI r7, 345
LDI r8, 134
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
