; DESCRIPTION: Places a green line segment connecting (143, 202) to (399, 114).
; PLAN: r0=143(x1), r1=202(y1), r2=399(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 202
LDI r2, 399
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
