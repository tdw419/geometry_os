; DESCRIPTION: Renders a green line between points (378, 251) and (242, 96).
; PLAN: r0=378(x1), r1=251(y1), r2=242(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 378
LDI r1, 251
LDI r2, 242
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
