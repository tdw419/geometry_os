; DESCRIPTION: Places a yellow line segment connecting (337, 236) to (403, 14).
; PLAN: r0=337(x1), r1=236(y1), r2=403(x2), r3=14(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 236
LDI r2, 403
LDI r3, 14
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
