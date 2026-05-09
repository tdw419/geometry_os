; DESCRIPTION: Composite: Sets a single magenta pixel at (90, 61) then Renders a yellow line between points (292, 191) and (172, 210).
; PLAN: r0=90(x), r1=61(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=292(x1), r6=191(y1), r7=172(x2), r8=210(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 61
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 292
LDI r6, 191
LDI r7, 172
LDI r8, 210
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
