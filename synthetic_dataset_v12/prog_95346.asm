; DESCRIPTION: Places a yellow line segment connecting (280, 2) to (503, 229).
; PLAN: r0=280(x1), r1=2(y1), r2=503(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 2
LDI r2, 503
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
