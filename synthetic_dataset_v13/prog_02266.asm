; DESCRIPTION: Places a red line segment connecting (27, 113) to (204, 94).
; PLAN: r0=27(x1), r1=113(y1), r2=204(x2), r3=94(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 113
LDI r2, 204
LDI r3, 94
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
