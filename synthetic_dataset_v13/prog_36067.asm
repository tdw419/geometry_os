; DESCRIPTION: Places a green line segment connecting (344, 33) to (393, 66).
; PLAN: r0=344(x1), r1=33(y1), r2=393(x2), r3=66(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 33
LDI r2, 393
LDI r3, 66
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
