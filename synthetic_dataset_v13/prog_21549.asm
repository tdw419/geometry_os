; DESCRIPTION: Renders a green line between points (448, 40) and (488, 139).
; PLAN: r0=448(x1), r1=40(y1), r2=488(x2), r3=139(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 40
LDI r2, 488
LDI r3, 139
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
