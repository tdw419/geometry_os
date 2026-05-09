; DESCRIPTION: Places a yellow line segment connecting (480, 95) to (60, 86).
; PLAN: r0=480(x1), r1=95(y1), r2=60(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 95
LDI r2, 60
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
