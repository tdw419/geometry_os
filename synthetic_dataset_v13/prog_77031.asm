; DESCRIPTION: Renders a cyan line between points (12, 223) and (311, 35).
; PLAN: r0=12(x1), r1=223(y1), r2=311(x2), r3=35(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 223
LDI r2, 311
LDI r3, 35
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
