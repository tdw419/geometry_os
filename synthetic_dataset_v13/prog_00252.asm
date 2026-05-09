; DESCRIPTION: Renders a green line between points (462, 186) and (117, 82).
; PLAN: r0=462(x1), r1=186(y1), r2=117(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 186
LDI r2, 117
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
