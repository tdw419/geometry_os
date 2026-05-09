; DESCRIPTION: Places a white line segment connecting (321, 145) to (27, 86).
; PLAN: r0=321(x1), r1=145(y1), r2=27(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 145
LDI r2, 27
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
