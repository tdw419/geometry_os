; DESCRIPTION: Places a blue line segment connecting (502, 229) to (24, 121).
; PLAN: r0=502(x1), r1=229(y1), r2=24(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 229
LDI r2, 24
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
