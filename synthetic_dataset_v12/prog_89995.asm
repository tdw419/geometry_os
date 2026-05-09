; DESCRIPTION: Places a cyan line segment connecting (15, 6) to (338, 80).
; PLAN: r0=15(x1), r1=6(y1), r2=338(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 6
LDI r2, 338
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
