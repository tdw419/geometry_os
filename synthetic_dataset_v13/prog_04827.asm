; DESCRIPTION: Places a cyan line segment connecting (232, 59) to (110, 11).
; PLAN: r0=232(x1), r1=59(y1), r2=110(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 59
LDI r2, 110
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
