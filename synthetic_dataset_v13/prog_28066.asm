; DESCRIPTION: Composite: Places a cyan dot at position (49, 82) then Renders a magenta line between points (2, 63) and (292, 17).
; PLAN: r0=49(x), r1=82(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=2(x1), r6=63(y1), r7=292(x2), r8=17(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 82
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 2
LDI r6, 63
LDI r7, 292
LDI r8, 17
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
