; DESCRIPTION: Composite: Places a purple dot at position (159, 151) then Draws a white line from (22, 203) to (148, 37).
; PLAN: r0=159(x), r1=151(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=22(x1), r6=203(y1), r7=148(x2), r8=37(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 151
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 22
LDI r6, 203
LDI r7, 148
LDI r8, 37
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
