; DESCRIPTION: Places a green line segment connecting (20, 40) to (292, 177).
; PLAN: r0=20(x1), r1=40(y1), r2=292(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 40
LDI r2, 292
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
