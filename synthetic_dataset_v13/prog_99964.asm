; DESCRIPTION: Places a green line segment connecting (270, 254) to (108, 164).
; PLAN: r0=270(x1), r1=254(y1), r2=108(x2), r3=164(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 254
LDI r2, 108
LDI r3, 164
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
