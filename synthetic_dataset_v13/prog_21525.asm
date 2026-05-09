; DESCRIPTION: Places a cyan line segment connecting (119, 7) to (84, 246).
; PLAN: r0=119(x1), r1=7(y1), r2=84(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 7
LDI r2, 84
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
