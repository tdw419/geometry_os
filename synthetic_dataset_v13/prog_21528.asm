; DESCRIPTION: Draws a green line from (398, 30) to (413, 218).
; PLAN: r0=398(x1), r1=30(y1), r2=413(x2), r3=218(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 30
LDI r2, 413
LDI r3, 218
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
