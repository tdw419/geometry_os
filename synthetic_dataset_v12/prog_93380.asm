; DESCRIPTION: Places a yellow line segment connecting (255, 95) to (91, 44).
; PLAN: r0=255(x1), r1=95(y1), r2=91(x2), r3=44(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 95
LDI r2, 91
LDI r3, 44
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
