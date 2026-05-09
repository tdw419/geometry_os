; DESCRIPTION: Composite: Sets a single cyan pixel at (443, 86) then Draws a green line from (467, 220) to (196, 107).
; PLAN: r0=443(x), r1=86(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=467(x1), r6=220(y1), r7=196(x2), r8=107(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 443
LDI r1, 86
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 467
LDI r6, 220
LDI r7, 196
LDI r8, 107
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
