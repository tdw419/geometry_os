; DESCRIPTION: Places a green line segment connecting (209, 166) to (229, 76).
; PLAN: r0=209(x1), r1=166(y1), r2=229(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 166
LDI r2, 229
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
