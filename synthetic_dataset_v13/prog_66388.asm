; DESCRIPTION: Places a green line segment connecting (117, 27) to (471, 102).
; PLAN: r0=117(x1), r1=27(y1), r2=471(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 27
LDI r2, 471
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
