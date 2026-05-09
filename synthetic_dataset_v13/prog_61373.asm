; DESCRIPTION: Renders a red line between points (138, 113) and (367, 243).
; PLAN: r0=138(x1), r1=113(y1), r2=367(x2), r3=243(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 113
LDI r2, 367
LDI r3, 243
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
