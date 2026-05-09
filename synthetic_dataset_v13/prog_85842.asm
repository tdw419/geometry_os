; DESCRIPTION: Composite: Places a cyan dot at position (440, 207) then Renders a red line between points (270, 153) and (159, 135).
; PLAN: r0=440(x), r1=207(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=270(x1), r6=153(y1), r7=159(x2), r8=135(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 440
LDI r1, 207
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 270
LDI r6, 153
LDI r7, 159
LDI r8, 135
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
