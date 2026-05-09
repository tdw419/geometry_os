; DESCRIPTION: Renders a yellow line between points (299, 171) and (335, 178).
; PLAN: r0=299(x1), r1=171(y1), r2=335(x2), r3=178(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 171
LDI r2, 335
LDI r3, 178
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
