; DESCRIPTION: Renders a cyan line between points (82, 225) and (155, 187).
; PLAN: r0=82(x1), r1=225(y1), r2=155(x2), r3=187(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 225
LDI r2, 155
LDI r3, 187
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
