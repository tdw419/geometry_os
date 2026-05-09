; DESCRIPTION: Renders a cyan line between points (308, 119) and (317, 37).
; PLAN: r0=308(x1), r1=119(y1), r2=317(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 119
LDI r2, 317
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
