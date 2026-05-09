; DESCRIPTION: Composite: Places a red dot at position (8, 209) then Renders a green line between points (183, 125) and (40, 51).
; PLAN: r0=8(x), r1=209(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=183(x1), r6=125(y1), r7=40(x2), r8=51(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 8
LDI r1, 209
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 183
LDI r6, 125
LDI r7, 40
LDI r8, 51
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
