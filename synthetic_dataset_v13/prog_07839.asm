; DESCRIPTION: Places a green line segment connecting (411, 214) to (81, 43).
; PLAN: r0=411(x1), r1=214(y1), r2=81(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 214
LDI r2, 81
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
