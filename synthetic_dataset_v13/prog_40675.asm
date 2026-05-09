; DESCRIPTION: Places a green line segment connecting (121, 51) to (207, 117).
; PLAN: r0=121(x1), r1=51(y1), r2=207(x2), r3=117(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 51
LDI r2, 207
LDI r3, 117
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
