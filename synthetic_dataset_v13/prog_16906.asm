; DESCRIPTION: Places a yellow line segment connecting (37, 143) to (1, 125).
; PLAN: r0=37(x1), r1=143(y1), r2=1(x2), r3=125(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 143
LDI r2, 1
LDI r3, 125
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
