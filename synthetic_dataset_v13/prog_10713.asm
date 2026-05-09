; DESCRIPTION: Places a red line segment connecting (503, 11) to (280, 234).
; PLAN: r0=503(x1), r1=11(y1), r2=280(x2), r3=234(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 11
LDI r2, 280
LDI r3, 234
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
