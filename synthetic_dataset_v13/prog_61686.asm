; DESCRIPTION: Composite: Sets a single green pixel at (34, 128) then Renders a blue line between points (180, 90) and (3, 149).
; PLAN: r0=34(x), r1=128(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=180(x1), r6=90(y1), r7=3(x2), r8=149(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 34
LDI r1, 128
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 180
LDI r6, 90
LDI r7, 3
LDI r8, 149
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
