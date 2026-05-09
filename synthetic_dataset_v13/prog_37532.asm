; DESCRIPTION: Places a black line segment connecting (404, 40) to (458, 168).
; PLAN: r0=404(x1), r1=40(y1), r2=458(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 40
LDI r2, 458
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
