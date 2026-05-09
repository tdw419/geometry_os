; DESCRIPTION: Composite: Sets a single purple pixel at (138, 122) then Renders a magenta line between points (12, 187) and (103, 206).
; PLAN: r0=138(x), r1=122(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=12(x1), r6=187(y1), r7=103(x2), r8=206(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 122
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 12
LDI r6, 187
LDI r7, 103
LDI r8, 206
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
