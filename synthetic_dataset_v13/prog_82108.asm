; DESCRIPTION: Places a green line segment connecting (283, 184) to (420, 60).
; PLAN: r0=283(x1), r1=184(y1), r2=420(x2), r3=60(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 184
LDI r2, 420
LDI r3, 60
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
