; DESCRIPTION: Renders a cyan line between points (38, 193) and (317, 106).
; PLAN: r0=38(x1), r1=193(y1), r2=317(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 193
LDI r2, 317
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
