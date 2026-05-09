; DESCRIPTION: Places a green line segment connecting (204, 199) to (180, 239).
; PLAN: r0=204(x1), r1=199(y1), r2=180(x2), r3=239(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 199
LDI r2, 180
LDI r3, 239
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
