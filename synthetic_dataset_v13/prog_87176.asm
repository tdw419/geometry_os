; DESCRIPTION: Renders a cyan line between points (45, 134) and (159, 205).
; PLAN: r0=45(x1), r1=134(y1), r2=159(x2), r3=205(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 134
LDI r2, 159
LDI r3, 205
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
