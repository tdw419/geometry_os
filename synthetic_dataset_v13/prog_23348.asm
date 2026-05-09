; DESCRIPTION: Places a cyan line segment connecting (138, 219) to (80, 250).
; PLAN: r0=138(x1), r1=219(y1), r2=80(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 219
LDI r2, 80
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
