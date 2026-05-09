; DESCRIPTION: Places a white line segment connecting (272, 243) to (23, 2).
; PLAN: r0=272(x1), r1=243(y1), r2=23(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 243
LDI r2, 23
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
