; DESCRIPTION: Places a green line segment connecting (454, 109) to (168, 26).
; PLAN: r0=454(x1), r1=109(y1), r2=168(x2), r3=26(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 109
LDI r2, 168
LDI r3, 26
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
