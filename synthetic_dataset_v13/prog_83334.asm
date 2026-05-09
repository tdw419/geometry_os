; DESCRIPTION: Renders a cyan line between points (489, 184) and (443, 170).
; PLAN: r0=489(x1), r1=184(y1), r2=443(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 184
LDI r2, 443
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
