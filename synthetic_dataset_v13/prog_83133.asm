; DESCRIPTION: Places a cyan line segment connecting (357, 155) to (70, 240).
; PLAN: r0=357(x1), r1=155(y1), r2=70(x2), r3=240(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 155
LDI r2, 70
LDI r3, 240
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
