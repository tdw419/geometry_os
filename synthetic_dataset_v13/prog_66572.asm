; DESCRIPTION: Renders a yellow line between points (403, 250) and (139, 239).
; PLAN: r0=403(x1), r1=250(y1), r2=139(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 250
LDI r2, 139
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
