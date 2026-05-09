; DESCRIPTION: Places a yellow line segment connecting (120, 79) to (197, 219).
; PLAN: r0=120(x1), r1=79(y1), r2=197(x2), r3=219(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 79
LDI r2, 197
LDI r3, 219
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
