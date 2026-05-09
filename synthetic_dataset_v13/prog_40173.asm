; DESCRIPTION: Renders a cyan line between points (477, 131) and (131, 115).
; PLAN: r0=477(x1), r1=131(y1), r2=131(x2), r3=115(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 131
LDI r2, 131
LDI r3, 115
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
