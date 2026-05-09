; DESCRIPTION: Places a blue line segment connecting (392, 221) to (221, 98).
; PLAN: r0=392(x1), r1=221(y1), r2=221(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 221
LDI r2, 221
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
