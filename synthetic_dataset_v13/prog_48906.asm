; DESCRIPTION: Renders a black line between points (163, 254) and (404, 202).
; PLAN: r0=163(x1), r1=254(y1), r2=404(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 254
LDI r2, 404
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
