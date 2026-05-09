; DESCRIPTION: Places a cyan line segment connecting (55, 255) to (357, 58).
; PLAN: r0=55(x1), r1=255(y1), r2=357(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 255
LDI r2, 357
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
