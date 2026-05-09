; DESCRIPTION: Places a green line segment connecting (288, 59) to (30, 52).
; PLAN: r0=288(x1), r1=59(y1), r2=30(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 59
LDI r2, 30
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
