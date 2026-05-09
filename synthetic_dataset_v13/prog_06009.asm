; DESCRIPTION: Places a green line segment connecting (154, 10) to (313, 79).
; PLAN: r0=154(x1), r1=10(y1), r2=313(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 10
LDI r2, 313
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
