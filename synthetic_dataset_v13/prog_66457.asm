; DESCRIPTION: Places a yellow line segment connecting (403, 120) to (416, 33).
; PLAN: r0=403(x1), r1=120(y1), r2=416(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 120
LDI r2, 416
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
