; DESCRIPTION: Renders a cyan line between points (159, 149) and (241, 106).
; PLAN: r0=159(x1), r1=149(y1), r2=241(x2), r3=106(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 149
LDI r2, 241
LDI r3, 106
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
