; DESCRIPTION: Places a green line segment connecting (315, 117) to (66, 208).
; PLAN: r0=315(x1), r1=117(y1), r2=66(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 117
LDI r2, 66
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
