; DESCRIPTION: Places a blue line segment connecting (96, 53) to (146, 126).
; PLAN: r0=96(x1), r1=53(y1), r2=146(x2), r3=126(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 53
LDI r2, 146
LDI r3, 126
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
