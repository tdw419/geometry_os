; DESCRIPTION: Places a green line segment connecting (11, 117) to (48, 69).
; PLAN: r0=11(x1), r1=117(y1), r2=48(x2), r3=69(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 117
LDI r2, 48
LDI r3, 69
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
