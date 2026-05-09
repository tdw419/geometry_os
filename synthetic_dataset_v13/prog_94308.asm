; DESCRIPTION: Places a red line segment connecting (386, 10) to (271, 218).
; PLAN: r0=386(x1), r1=10(y1), r2=271(x2), r3=218(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 10
LDI r2, 271
LDI r3, 218
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
