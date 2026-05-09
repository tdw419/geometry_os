; DESCRIPTION: Renders a magenta line between points (272, 26) and (238, 161).
; PLAN: r0=272(x1), r1=26(y1), r2=238(x2), r3=161(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 26
LDI r2, 238
LDI r3, 161
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
