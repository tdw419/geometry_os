; DESCRIPTION: Renders a green line between points (262, 171) and (359, 241).
; PLAN: r0=262(x1), r1=171(y1), r2=359(x2), r3=241(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 171
LDI r2, 359
LDI r3, 241
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
