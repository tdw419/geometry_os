; DESCRIPTION: Places a blue line segment connecting (392, 206) to (23, 43).
; PLAN: r0=392(x1), r1=206(y1), r2=23(x2), r3=43(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 206
LDI r2, 23
LDI r3, 43
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
