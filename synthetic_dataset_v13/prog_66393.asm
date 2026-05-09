; DESCRIPTION: Places a green line segment connecting (486, 254) to (492, 239).
; PLAN: r0=486(x1), r1=254(y1), r2=492(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 254
LDI r2, 492
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
