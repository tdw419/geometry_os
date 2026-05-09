; DESCRIPTION: Renders a yellow line between points (387, 179) and (186, 171).
; PLAN: r0=387(x1), r1=179(y1), r2=186(x2), r3=171(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 179
LDI r2, 186
LDI r3, 171
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
