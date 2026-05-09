; DESCRIPTION: Renders a cyan line between points (60, 179) and (78, 227).
; PLAN: r0=60(x1), r1=179(y1), r2=78(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 179
LDI r2, 78
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
