; DESCRIPTION: Composite: Places a blue dot at position (473, 169) then Draws a blue line from (134, 189) to (441, 43).
; PLAN: r0=473(x), r1=169(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=134(x1), r6=189(y1), r7=441(x2), r8=43(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 473
LDI r1, 169
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 134
LDI r6, 189
LDI r7, 441
LDI r8, 43
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
