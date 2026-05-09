; DESCRIPTION: Composite: Sets a single blue pixel at (416, 213) then Renders a green line between points (282, 235) and (96, 9).
; PLAN: r0=416(x), r1=213(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=282(x1), r6=235(y1), r7=96(x2), r8=9(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 213
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 282
LDI r6, 235
LDI r7, 96
LDI r8, 9
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
