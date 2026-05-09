; DESCRIPTION: Renders a red line between points (321, 171) and (61, 103).
; PLAN: r0=321(x1), r1=171(y1), r2=61(x2), r3=103(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 171
LDI r2, 61
LDI r3, 103
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
