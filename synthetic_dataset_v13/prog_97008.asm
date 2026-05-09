; DESCRIPTION: Composite: Places a purple dot at position (104, 250) then Renders a magenta line between points (249, 46) and (237, 213).
; PLAN: r0=104(x), r1=250(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=249(x1), r6=46(y1), r7=237(x2), r8=213(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 250
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 46
LDI r7, 237
LDI r8, 213
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
