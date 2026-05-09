; DESCRIPTION: Places a green line segment connecting (388, 229) to (121, 113).
; PLAN: r0=388(x1), r1=229(y1), r2=121(x2), r3=113(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 388
LDI r1, 229
LDI r2, 121
LDI r3, 113
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
