; DESCRIPTION: Places a green line segment connecting (222, 236) to (338, 125).
; PLAN: r0=222(x1), r1=236(y1), r2=338(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 236
LDI r2, 338
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
