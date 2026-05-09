; DESCRIPTION: Places a green line segment connecting (424, 66) to (173, 229).
; PLAN: r0=424(x1), r1=66(y1), r2=173(x2), r3=229(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 66
LDI r2, 173
LDI r3, 229
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
