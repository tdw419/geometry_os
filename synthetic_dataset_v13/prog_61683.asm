; DESCRIPTION: Places a green line segment connecting (194, 215) to (33, 36).
; PLAN: r0=194(x1), r1=215(y1), r2=33(x2), r3=36(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 215
LDI r2, 33
LDI r3, 36
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
