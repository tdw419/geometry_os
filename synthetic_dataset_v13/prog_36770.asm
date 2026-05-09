; DESCRIPTION: Composite: Places a blue dot at position (437, 176) then Renders a black line between points (74, 222) and (142, 26).
; PLAN: r0=437(x), r1=176(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=74(x1), r6=222(y1), r7=142(x2), r8=26(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 437
LDI r1, 176
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 74
LDI r6, 222
LDI r7, 142
LDI r8, 26
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
