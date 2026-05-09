; DESCRIPTION: Places a blue line segment connecting (146, 121) to (499, 25).
; PLAN: r0=146(x1), r1=121(y1), r2=499(x2), r3=25(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 121
LDI r2, 499
LDI r3, 25
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
