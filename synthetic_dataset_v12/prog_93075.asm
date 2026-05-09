; DESCRIPTION: Places a yellow line segment connecting (127, 143) to (255, 25).
; PLAN: r0=127(x1), r1=143(y1), r2=255(x2), r3=25(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 143
LDI r2, 255
LDI r3, 25
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
