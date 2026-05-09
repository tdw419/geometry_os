; DESCRIPTION: Places a white line segment connecting (161, 106) to (367, 198).
; PLAN: r0=161(x1), r1=106(y1), r2=367(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 106
LDI r2, 367
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
