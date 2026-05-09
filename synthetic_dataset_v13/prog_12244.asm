; DESCRIPTION: Renders a white line between points (229, 146) and (81, 99).
; PLAN: r0=229(x1), r1=146(y1), r2=81(x2), r3=99(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 146
LDI r2, 81
LDI r3, 99
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
