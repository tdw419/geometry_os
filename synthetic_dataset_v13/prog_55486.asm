; DESCRIPTION: Renders a green line between points (448, 19) and (481, 19).
; PLAN: r0=448(x1), r1=19(y1), r2=481(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 19
LDI r2, 481
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
