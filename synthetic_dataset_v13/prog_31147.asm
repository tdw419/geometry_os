; DESCRIPTION: Renders a cyan line between points (118, 51) and (308, 44).
; PLAN: r0=118(x1), r1=51(y1), r2=308(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 51
LDI r2, 308
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
