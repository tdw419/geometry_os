; DESCRIPTION: Places a cyan line segment connecting (181, 61) to (287, 120).
; PLAN: r0=181(x1), r1=61(y1), r2=287(x2), r3=120(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 61
LDI r2, 287
LDI r3, 120
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
