; DESCRIPTION: Places a cyan line segment connecting (91, 60) to (56, 133).
; PLAN: r0=91(x1), r1=60(y1), r2=56(x2), r3=133(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 60
LDI r2, 56
LDI r3, 133
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
