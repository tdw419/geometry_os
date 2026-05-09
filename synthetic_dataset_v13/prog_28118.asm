; DESCRIPTION: Places a blue line segment connecting (116, 36) to (213, 76).
; PLAN: r0=116(x1), r1=36(y1), r2=213(x2), r3=76(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 36
LDI r2, 213
LDI r3, 76
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
