; DESCRIPTION: Places a cyan line segment connecting (313, 79) to (36, 61).
; PLAN: r0=313(x1), r1=79(y1), r2=36(x2), r3=61(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 79
LDI r2, 36
LDI r3, 61
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
