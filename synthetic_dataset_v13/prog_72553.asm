; DESCRIPTION: Renders a red line between points (511, 98) and (197, 162).
; PLAN: r0=511(x1), r1=98(y1), r2=197(x2), r3=162(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 98
LDI r2, 197
LDI r3, 162
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
