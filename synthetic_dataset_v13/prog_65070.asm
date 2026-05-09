; DESCRIPTION: Places a yellow line segment connecting (425, 37) to (492, 229).
; PLAN: r0=425(x1), r1=37(y1), r2=492(x2), r3=229(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 37
LDI r2, 492
LDI r3, 229
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
