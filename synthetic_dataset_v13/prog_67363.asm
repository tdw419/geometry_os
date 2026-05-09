; DESCRIPTION: Renders a black line between points (404, 214) and (437, 34).
; PLAN: r0=404(x1), r1=214(y1), r2=437(x2), r3=34(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 214
LDI r2, 437
LDI r3, 34
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
