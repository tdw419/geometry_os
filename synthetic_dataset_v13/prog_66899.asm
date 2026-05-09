; DESCRIPTION: Places a green line segment connecting (288, 149) to (193, 132).
; PLAN: r0=288(x1), r1=149(y1), r2=193(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 149
LDI r2, 193
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
