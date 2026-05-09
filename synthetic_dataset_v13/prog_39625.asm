; DESCRIPTION: Renders a blue line between points (281, 251) and (79, 139).
; PLAN: r0=281(x1), r1=251(y1), r2=79(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 251
LDI r2, 79
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
