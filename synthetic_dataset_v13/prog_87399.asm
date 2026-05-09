; DESCRIPTION: Renders a green line between points (302, 238) and (422, 254).
; PLAN: r0=302(x1), r1=238(y1), r2=422(x2), r3=254(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 238
LDI r2, 422
LDI r3, 254
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
