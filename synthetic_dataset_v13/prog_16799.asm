; DESCRIPTION: Renders a red line between points (511, 171) and (270, 115).
; PLAN: r0=511(x1), r1=171(y1), r2=270(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 171
LDI r2, 270
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
