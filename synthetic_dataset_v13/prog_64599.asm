; DESCRIPTION: Places a orange line segment connecting (333, 149) to (222, 236).
; PLAN: r0=333(x1), r1=149(y1), r2=222(x2), r3=236(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 149
LDI r2, 222
LDI r3, 236
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
