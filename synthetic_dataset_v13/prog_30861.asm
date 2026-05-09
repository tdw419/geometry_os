; DESCRIPTION: Renders a green line between points (262, 180) and (44, 125).
; PLAN: r0=262(x1), r1=180(y1), r2=44(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 180
LDI r2, 44
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
