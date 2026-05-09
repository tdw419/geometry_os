; DESCRIPTION: Places a black line segment connecting (413, 113) to (429, 221).
; PLAN: r0=413(x1), r1=113(y1), r2=429(x2), r3=221(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 113
LDI r2, 429
LDI r3, 221
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
