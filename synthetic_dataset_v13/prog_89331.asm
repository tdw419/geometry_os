; DESCRIPTION: Renders a red line between points (161, 195) and (220, 217).
; PLAN: r0=161(x1), r1=195(y1), r2=220(x2), r3=217(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 195
LDI r2, 220
LDI r3, 217
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
