; DESCRIPTION: Renders a cyan line between points (484, 95) and (29, 200).
; PLAN: r0=484(x1), r1=95(y1), r2=29(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 95
LDI r2, 29
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
