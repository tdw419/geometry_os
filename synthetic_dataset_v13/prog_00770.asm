; DESCRIPTION: Places a blue line segment connecting (271, 100) to (146, 173).
; PLAN: r0=271(x1), r1=100(y1), r2=146(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 100
LDI r2, 146
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
