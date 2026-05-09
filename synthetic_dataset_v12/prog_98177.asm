; DESCRIPTION: Renders a green line between points (141, 171) and (82, 214).
; PLAN: r0=141(x1), r1=171(y1), r2=82(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 171
LDI r2, 82
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
