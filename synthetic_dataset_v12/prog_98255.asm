; DESCRIPTION: Places a green line segment connecting (503, 225) to (164, 1).
; PLAN: r0=503(x1), r1=225(y1), r2=164(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 225
LDI r2, 164
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
