; DESCRIPTION: Composite: Sets a single magenta pixel at (138, 168) then Renders a blue line between points (130, 245) and (325, 182).
; PLAN: r0=138(x), r1=168(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=130(x1), r6=245(y1), r7=325(x2), r8=182(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 168
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 130
LDI r6, 245
LDI r7, 325
LDI r8, 182
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
