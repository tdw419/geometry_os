; DESCRIPTION: Places a green line segment connecting (193, 113) to (148, 32).
; PLAN: r0=193(x1), r1=113(y1), r2=148(x2), r3=32(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 113
LDI r2, 148
LDI r3, 32
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
