; DESCRIPTION: Places a green line segment connecting (352, 194) to (221, 133).
; PLAN: r0=352(x1), r1=194(y1), r2=221(x2), r3=133(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 194
LDI r2, 221
LDI r3, 133
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
