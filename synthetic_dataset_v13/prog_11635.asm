; DESCRIPTION: Renders a white line between points (185, 161) and (330, 66).
; PLAN: r0=185(x1), r1=161(y1), r2=330(x2), r3=66(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 161
LDI r2, 330
LDI r3, 66
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
