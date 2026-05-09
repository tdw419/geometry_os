; DESCRIPTION: Places a green line segment connecting (71, 183) to (411, 18).
; PLAN: r0=71(x1), r1=183(y1), r2=411(x2), r3=18(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 183
LDI r2, 411
LDI r3, 18
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
