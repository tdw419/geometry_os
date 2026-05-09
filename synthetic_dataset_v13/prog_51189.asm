; DESCRIPTION: Places a white line segment connecting (27, 37) to (334, 229).
; PLAN: r0=27(x1), r1=37(y1), r2=334(x2), r3=229(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 37
LDI r2, 334
LDI r3, 229
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
