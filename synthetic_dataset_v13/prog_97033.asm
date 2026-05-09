; DESCRIPTION: Places a green line segment connecting (146, 151) to (357, 234).
; PLAN: r0=146(x1), r1=151(y1), r2=357(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 151
LDI r2, 357
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
