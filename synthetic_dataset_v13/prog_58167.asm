; DESCRIPTION: Composite: Sets a single magenta pixel at (356, 71) then Renders a blue line between points (166, 123) and (460, 213).
; PLAN: r0=356(x), r1=71(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=166(x1), r6=123(y1), r7=460(x2), r8=213(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 71
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 166
LDI r6, 123
LDI r7, 460
LDI r8, 213
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
