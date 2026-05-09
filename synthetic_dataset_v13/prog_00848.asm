; DESCRIPTION: Renders a green line between points (134, 226) and (221, 230).
; PLAN: r0=134(x1), r1=226(y1), r2=221(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 226
LDI r2, 221
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
