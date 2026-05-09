; DESCRIPTION: Places a cyan line segment connecting (442, 22) to (413, 1).
; PLAN: r0=442(x1), r1=22(y1), r2=413(x2), r3=1(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 22
LDI r2, 413
LDI r3, 1
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
