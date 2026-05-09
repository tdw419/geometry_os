; DESCRIPTION: Composite: Places a purple dot at position (33, 93) then Renders a magenta line between points (346, 134) and (179, 112).
; PLAN: r0=33(x), r1=93(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=346(x1), r6=134(y1), r7=179(x2), r8=112(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 93
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 346
LDI r6, 134
LDI r7, 179
LDI r8, 112
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
