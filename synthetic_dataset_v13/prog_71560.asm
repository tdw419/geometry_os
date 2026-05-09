; DESCRIPTION: Renders a green line between points (336, 108) and (207, 124).
; PLAN: r0=336(x1), r1=108(y1), r2=207(x2), r3=124(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 336
LDI r1, 108
LDI r2, 207
LDI r3, 124
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
