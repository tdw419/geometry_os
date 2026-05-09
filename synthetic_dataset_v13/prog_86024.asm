; DESCRIPTION: Places a magenta line segment connecting (66, 121) to (110, 33).
; PLAN: r0=66(x1), r1=121(y1), r2=110(x2), r3=33(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 121
LDI r2, 110
LDI r3, 33
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
