; DESCRIPTION: Renders a yellow line between points (336, 76) and (433, 171).
; PLAN: r0=336(x1), r1=76(y1), r2=433(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 76
LDI r2, 433
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
