; DESCRIPTION: Renders a yellow line between points (221, 171) and (61, 174).
; PLAN: r0=221(x1), r1=171(y1), r2=61(x2), r3=174(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 171
LDI r2, 61
LDI r3, 174
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
