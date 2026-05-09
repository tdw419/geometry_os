; DESCRIPTION: Places a green line segment connecting (179, 184) to (121, 225).
; PLAN: r0=179(x1), r1=184(y1), r2=121(x2), r3=225(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 184
LDI r2, 121
LDI r3, 225
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
