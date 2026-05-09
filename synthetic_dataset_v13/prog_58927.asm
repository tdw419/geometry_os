; DESCRIPTION: Places a purple line segment connecting (511, 239) to (413, 14).
; PLAN: r0=511(x1), r1=239(y1), r2=413(x2), r3=14(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 239
LDI r2, 413
LDI r3, 14
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
