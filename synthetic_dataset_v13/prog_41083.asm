; DESCRIPTION: Places a green line segment connecting (460, 100) to (59, 94).
; PLAN: r0=460(x1), r1=100(y1), r2=59(x2), r3=94(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 100
LDI r2, 59
LDI r3, 94
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
