; DESCRIPTION: Places a red line segment connecting (500, 225) to (135, 234).
; PLAN: r0=500(x1), r1=225(y1), r2=135(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 225
LDI r2, 135
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
