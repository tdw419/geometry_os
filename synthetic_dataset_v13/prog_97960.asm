; DESCRIPTION: Places a yellow line segment connecting (33, 184) to (415, 108).
; PLAN: r0=33(x1), r1=184(y1), r2=415(x2), r3=108(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 184
LDI r2, 415
LDI r3, 108
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
