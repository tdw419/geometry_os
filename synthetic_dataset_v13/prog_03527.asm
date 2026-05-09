; DESCRIPTION: Renders a red line between points (98, 157) and (212, 146).
; PLAN: r0=98(x1), r1=157(y1), r2=212(x2), r3=146(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 157
LDI r2, 212
LDI r3, 146
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
