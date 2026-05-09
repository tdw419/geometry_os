; DESCRIPTION: Places a blue line segment connecting (387, 25) to (138, 126).
; PLAN: r0=387(x1), r1=25(y1), r2=138(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 25
LDI r2, 138
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
