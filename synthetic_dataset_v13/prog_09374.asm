; DESCRIPTION: Places a green line segment connecting (262, 69) to (506, 160).
; PLAN: r0=262(x1), r1=69(y1), r2=506(x2), r3=160(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 69
LDI r2, 506
LDI r3, 160
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
