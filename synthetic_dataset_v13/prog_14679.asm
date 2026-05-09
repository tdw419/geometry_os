; DESCRIPTION: Renders a white line between points (161, 226) and (57, 105).
; PLAN: r0=161(x1), r1=226(y1), r2=57(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 226
LDI r2, 57
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
