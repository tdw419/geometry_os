; DESCRIPTION: Places a blue line segment connecting (509, 213) to (109, 239).
; PLAN: r0=509(x1), r1=213(y1), r2=109(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 213
LDI r2, 109
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
