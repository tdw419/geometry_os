; DESCRIPTION: Composite: Places a magenta dot at position (104, 134) then Renders a blue line between points (490, 186) and (245, 71).
; PLAN: r0=104(x), r1=134(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=490(x1), r6=186(y1), r7=245(x2), r8=71(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 104
LDI r1, 134
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 490
LDI r6, 186
LDI r7, 245
LDI r8, 71
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
