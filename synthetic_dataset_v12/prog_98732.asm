; DESCRIPTION: Places a red line segment connecting (19, 209) to (379, 115).
; PLAN: r0=19(x1), r1=209(y1), r2=379(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 209
LDI r2, 379
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
