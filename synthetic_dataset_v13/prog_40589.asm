; DESCRIPTION: Places a purple line segment connecting (403, 131) to (113, 166).
; PLAN: r0=403(x1), r1=131(y1), r2=113(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 131
LDI r2, 113
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
