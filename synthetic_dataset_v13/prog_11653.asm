; DESCRIPTION: Places a red line segment connecting (457, 223) to (404, 219).
; PLAN: r0=457(x1), r1=223(y1), r2=404(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 223
LDI r2, 404
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
