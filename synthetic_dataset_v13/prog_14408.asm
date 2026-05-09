; DESCRIPTION: Places a green line segment connecting (27, 214) to (221, 148).
; PLAN: r0=27(x1), r1=214(y1), r2=221(x2), r3=148(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 214
LDI r2, 221
LDI r3, 148
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
