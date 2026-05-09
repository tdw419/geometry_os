; DESCRIPTION: Places a green line segment connecting (179, 70) to (332, 177).
; PLAN: r0=179(x1), r1=70(y1), r2=332(x2), r3=177(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 70
LDI r2, 332
LDI r3, 177
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
