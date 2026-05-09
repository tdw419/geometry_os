; DESCRIPTION: Renders a white line between points (125, 202) and (81, 21).
; PLAN: r0=125(x1), r1=202(y1), r2=81(x2), r3=21(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 202
LDI r2, 81
LDI r3, 21
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
