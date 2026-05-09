; DESCRIPTION: Places a green line segment connecting (180, 8) to (256, 80).
; PLAN: r0=180(x1), r1=8(y1), r2=256(x2), r3=80(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 8
LDI r2, 256
LDI r3, 80
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
