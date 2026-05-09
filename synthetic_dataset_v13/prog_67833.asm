; DESCRIPTION: Composite: Sets a single cyan pixel at (29, 51) then Draws a green line from (327, 22) to (241, 148).
; PLAN: r0=29(x), r1=51(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=327(x1), r6=22(y1), r7=241(x2), r8=148(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 51
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 327
LDI r6, 22
LDI r7, 241
LDI r8, 148
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
