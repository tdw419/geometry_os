; DESCRIPTION: Composite: Places a white dot at position (176, 96) then Renders a purple line between points (77, 107) and (138, 113).
; PLAN: r0=176(x), r1=96(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=77(x1), r6=107(y1), r7=138(x2), r8=113(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 176
LDI r1, 96
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 77
LDI r6, 107
LDI r7, 138
LDI r8, 113
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
