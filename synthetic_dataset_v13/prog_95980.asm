; DESCRIPTION: Places a green line segment connecting (176, 181) to (120, 5).
; PLAN: r0=176(x1), r1=181(y1), r2=120(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 181
LDI r2, 120
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
