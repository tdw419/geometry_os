; DESCRIPTION: Places a red line segment connecting (148, 254) to (63, 33).
; PLAN: r0=148(x1), r1=254(y1), r2=63(x2), r3=33(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 254
LDI r2, 63
LDI r3, 33
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
