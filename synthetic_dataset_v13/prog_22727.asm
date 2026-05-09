; DESCRIPTION: Places a cyan line segment connecting (4, 113) to (423, 61).
; PLAN: r0=4(x1), r1=113(y1), r2=423(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 113
LDI r2, 423
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
