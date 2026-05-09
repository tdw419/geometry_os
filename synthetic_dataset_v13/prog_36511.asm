; DESCRIPTION: Places a blue line segment connecting (187, 160) to (412, 173).
; PLAN: r0=187(x1), r1=160(y1), r2=412(x2), r3=173(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 160
LDI r2, 412
LDI r3, 173
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
