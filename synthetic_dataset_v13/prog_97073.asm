; DESCRIPTION: Renders a cyan line between points (279, 238) and (201, 10).
; PLAN: r0=279(x1), r1=238(y1), r2=201(x2), r3=10(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 238
LDI r2, 201
LDI r3, 10
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
