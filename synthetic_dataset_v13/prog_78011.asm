; DESCRIPTION: Composite: Sets a single cyan pixel at (138, 183) then Renders a blue line between points (491, 139) and (499, 168).
; PLAN: r0=138(x), r1=183(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=491(x1), r6=139(y1), r7=499(x2), r8=168(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 138
LDI r1, 183
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 139
LDI r7, 499
LDI r8, 168
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
