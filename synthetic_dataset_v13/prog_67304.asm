; DESCRIPTION: Places a green line segment connecting (135, 68) to (207, 249).
; PLAN: r0=135(x1), r1=68(y1), r2=207(x2), r3=249(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 68
LDI r2, 207
LDI r3, 249
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
