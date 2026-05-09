; DESCRIPTION: Places a blue line segment connecting (295, 143) to (78, 28).
; PLAN: r0=295(x1), r1=143(y1), r2=78(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 143
LDI r2, 78
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
