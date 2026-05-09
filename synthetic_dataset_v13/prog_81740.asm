; DESCRIPTION: Renders a yellow line between points (403, 48) and (422, 206).
; PLAN: r0=403(x1), r1=48(y1), r2=422(x2), r3=206(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 48
LDI r2, 422
LDI r3, 206
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
