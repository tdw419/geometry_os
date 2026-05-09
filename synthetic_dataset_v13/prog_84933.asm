; DESCRIPTION: Places a red line segment connecting (13, 68) to (207, 239).
; PLAN: r0=13(x1), r1=68(y1), r2=207(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 68
LDI r2, 207
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
