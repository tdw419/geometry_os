; DESCRIPTION: Renders a black line between points (190, 107) and (230, 109).
; PLAN: r0=190(x1), r1=107(y1), r2=230(x2), r3=109(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 190
LDI r1, 107
LDI r2, 230
LDI r3, 109
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
