; DESCRIPTION: Places a blue line segment connecting (283, 210) to (290, 59).
; PLAN: r0=283(x1), r1=210(y1), r2=290(x2), r3=59(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 210
LDI r2, 290
LDI r3, 59
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
