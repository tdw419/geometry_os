; DESCRIPTION: Places a cyan line segment connecting (492, 24) to (80, 2).
; PLAN: r0=492(x1), r1=24(y1), r2=80(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 24
LDI r2, 80
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
