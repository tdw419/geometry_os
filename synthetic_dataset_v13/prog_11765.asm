; DESCRIPTION: Places a blue line segment connecting (105, 173) to (367, 59).
; PLAN: r0=105(x1), r1=173(y1), r2=367(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 173
LDI r2, 367
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
