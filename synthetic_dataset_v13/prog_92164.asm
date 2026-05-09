; DESCRIPTION: Renders a cyan line between points (432, 195) and (308, 80).
; PLAN: r0=432(x1), r1=195(y1), r2=308(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 195
LDI r2, 308
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
