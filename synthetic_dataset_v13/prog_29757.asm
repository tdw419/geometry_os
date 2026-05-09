; DESCRIPTION: Places a green line segment connecting (207, 161) to (413, 91).
; PLAN: r0=207(x1), r1=161(y1), r2=413(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 161
LDI r2, 413
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
