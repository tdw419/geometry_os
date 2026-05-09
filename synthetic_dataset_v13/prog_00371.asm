; DESCRIPTION: Places a blue line segment connecting (465, 82) to (9, 82).
; PLAN: r0=465(x1), r1=82(y1), r2=9(x2), r3=82(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 82
LDI r2, 9
LDI r3, 82
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
