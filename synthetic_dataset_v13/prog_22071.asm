; DESCRIPTION: Composite: Sets a single magenta pixel at (60, 62) then Renders a blue line between points (465, 86) and (471, 52).
; PLAN: r0=60(x), r1=62(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=465(x1), r6=86(y1), r7=471(x2), r8=52(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 62
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 465
LDI r6, 86
LDI r7, 471
LDI r8, 52
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
