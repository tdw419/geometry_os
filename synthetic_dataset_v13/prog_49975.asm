; DESCRIPTION: Places a blue line segment connecting (50, 17) to (205, 239).
; PLAN: r0=50(x1), r1=17(y1), r2=205(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 17
LDI r2, 205
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
