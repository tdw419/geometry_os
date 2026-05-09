; DESCRIPTION: Places a red line segment connecting (403, 88) to (115, 177).
; PLAN: r0=403(x1), r1=88(y1), r2=115(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 88
LDI r2, 115
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
