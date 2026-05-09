; DESCRIPTION: Composite: Places a blue dot at position (309, 43) then Renders a green line between points (81, 31) and (426, 69).
; PLAN: r0=309(x), r1=43(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=81(x1), r6=31(y1), r7=426(x2), r8=69(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 309
LDI r1, 43
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 31
LDI r7, 426
LDI r8, 69
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
