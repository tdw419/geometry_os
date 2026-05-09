; DESCRIPTION: Places a green line segment connecting (108, 16) to (392, 251).
; PLAN: r0=108(x1), r1=16(y1), r2=392(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 16
LDI r2, 392
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
