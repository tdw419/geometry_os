; DESCRIPTION: Renders a red line between points (178, 134) and (409, 134).
; PLAN: r0=178(x1), r1=134(y1), r2=409(x2), r3=134(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 134
LDI r2, 409
LDI r3, 134
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
