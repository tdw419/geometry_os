; DESCRIPTION: Places a blue line segment connecting (421, 50) to (211, 239).
; PLAN: r0=421(x1), r1=50(y1), r2=211(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 50
LDI r2, 211
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
