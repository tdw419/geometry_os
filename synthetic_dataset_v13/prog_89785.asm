; DESCRIPTION: Composite: Places a red dot at position (158, 134) then Renders a yellow line between points (455, 157) and (80, 235).
; PLAN: r0=158(x), r1=134(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=455(x1), r6=157(y1), r7=80(x2), r8=235(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 158
LDI r1, 134
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 455
LDI r6, 157
LDI r7, 80
LDI r8, 235
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
