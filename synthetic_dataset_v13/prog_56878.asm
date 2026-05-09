; DESCRIPTION: Draws a blue line from (398, 171) to (500, 239).
; PLAN: r0=398(x1), r1=171(y1), r2=500(x2), r3=239(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 171
LDI r2, 500
LDI r3, 239
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
