; DESCRIPTION: Renders a cyan line between points (407, 236) and (477, 133).
; PLAN: r0=407(x1), r1=236(y1), r2=477(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 236
LDI r2, 477
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
