; DESCRIPTION: Places a blue line segment connecting (387, 25) to (434, 205).
; PLAN: r0=387(x1), r1=25(y1), r2=434(x2), r3=205(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 25
LDI r2, 434
LDI r3, 205
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
