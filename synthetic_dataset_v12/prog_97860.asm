; DESCRIPTION: Places a green line segment connecting (46, 60) to (333, 77).
; PLAN: r0=46(x1), r1=60(y1), r2=333(x2), r3=77(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 60
LDI r2, 333
LDI r3, 77
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
