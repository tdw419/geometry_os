; DESCRIPTION: Renders a green line between points (427, 230) and (279, 82).
; PLAN: r0=427(x1), r1=230(y1), r2=279(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 230
LDI r2, 279
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
