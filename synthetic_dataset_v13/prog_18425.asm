; DESCRIPTION: Places a green line segment connecting (118, 122) to (305, 19).
; PLAN: r0=118(x1), r1=122(y1), r2=305(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 122
LDI r2, 305
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
