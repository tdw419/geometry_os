; DESCRIPTION: Places a green line segment connecting (20, 23) to (503, 177).
; PLAN: r0=20(x1), r1=23(y1), r2=503(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 23
LDI r2, 503
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
