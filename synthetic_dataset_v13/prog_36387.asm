; DESCRIPTION: Places a green line segment connecting (90, 184) to (392, 7).
; PLAN: r0=90(x1), r1=184(y1), r2=392(x2), r3=7(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 184
LDI r2, 392
LDI r3, 7
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
