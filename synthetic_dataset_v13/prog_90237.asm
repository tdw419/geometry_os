; DESCRIPTION: Places a green line segment connecting (77, 117) to (210, 233).
; PLAN: r0=77(x1), r1=117(y1), r2=210(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 117
LDI r2, 210
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
