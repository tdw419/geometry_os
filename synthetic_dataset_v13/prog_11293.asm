; DESCRIPTION: Renders a white line between points (301, 232) and (186, 225).
; PLAN: r0=301(x1), r1=232(y1), r2=186(x2), r3=225(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 232
LDI r2, 186
LDI r3, 225
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
