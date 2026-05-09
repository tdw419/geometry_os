; DESCRIPTION: Places a cyan line segment connecting (442, 44) to (413, 84).
; PLAN: r0=442(x1), r1=44(y1), r2=413(x2), r3=84(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 44
LDI r2, 413
LDI r3, 84
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
