; DESCRIPTION: Renders a red line between points (389, 38) and (287, 239).
; PLAN: r0=389(x1), r1=38(y1), r2=287(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 38
LDI r2, 287
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
