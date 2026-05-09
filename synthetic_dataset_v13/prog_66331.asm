; DESCRIPTION: Renders a cyan line between points (349, 244) and (186, 119).
; PLAN: r0=349(x1), r1=244(y1), r2=186(x2), r3=119(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 244
LDI r2, 186
LDI r3, 119
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
