; DESCRIPTION: Renders a cyan line between points (299, 198) and (507, 51).
; PLAN: r0=299(x1), r1=198(y1), r2=507(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 198
LDI r2, 507
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
