; DESCRIPTION: Places a cyan line segment connecting (428, 55) to (162, 136).
; PLAN: r0=428(x1), r1=55(y1), r2=162(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 55
LDI r2, 162
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
