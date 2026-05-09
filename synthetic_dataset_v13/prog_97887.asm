; DESCRIPTION: Places a blue line segment connecting (450, 51) to (173, 239).
; PLAN: r0=450(x1), r1=51(y1), r2=173(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 51
LDI r2, 173
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
