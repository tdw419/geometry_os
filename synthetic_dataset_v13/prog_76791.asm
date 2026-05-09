; DESCRIPTION: Places a green line segment connecting (165, 186) to (492, 105).
; PLAN: r0=165(x1), r1=186(y1), r2=492(x2), r3=105(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 186
LDI r2, 492
LDI r3, 105
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
