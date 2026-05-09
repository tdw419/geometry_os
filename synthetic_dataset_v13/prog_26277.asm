; DESCRIPTION: Places a green line segment connecting (493, 181) to (166, 231).
; PLAN: r0=493(x1), r1=181(y1), r2=166(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 181
LDI r2, 166
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
