; DESCRIPTION: Places a yellow line segment connecting (403, 126) to (106, 249).
; PLAN: r0=403(x1), r1=126(y1), r2=106(x2), r3=249(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 126
LDI r2, 106
LDI r3, 249
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
