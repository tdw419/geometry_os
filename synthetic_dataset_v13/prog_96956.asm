; DESCRIPTION: Places a green line segment connecting (69, 3) to (19, 68).
; PLAN: r0=69(x1), r1=3(y1), r2=19(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 3
LDI r2, 19
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
