; DESCRIPTION: Renders a cyan line between points (443, 172) and (94, 160).
; PLAN: r0=443(x1), r1=172(y1), r2=94(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 172
LDI r2, 94
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
