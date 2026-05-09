; DESCRIPTION: Places a yellow line segment connecting (327, 229) to (502, 34).
; PLAN: r0=327(x1), r1=229(y1), r2=502(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 229
LDI r2, 502
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
