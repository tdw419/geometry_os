; DESCRIPTION: Places a cyan line segment connecting (292, 33) to (199, 133).
; PLAN: r0=292(x1), r1=33(y1), r2=199(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 33
LDI r2, 199
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
