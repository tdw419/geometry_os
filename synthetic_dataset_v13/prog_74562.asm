; DESCRIPTION: Places a cyan line segment connecting (269, 4) to (484, 62).
; PLAN: r0=269(x1), r1=4(y1), r2=484(x2), r3=62(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 4
LDI r2, 484
LDI r3, 62
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
