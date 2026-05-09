; DESCRIPTION: Places a green line segment connecting (48, 180) to (104, 84).
; PLAN: r0=48(x1), r1=180(y1), r2=104(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 180
LDI r2, 104
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
