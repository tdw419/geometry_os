; DESCRIPTION: Draws a green line from (23, 75) to (28, 22).
; PLAN: r0=23(x1), r1=75(y1), r2=28(x2), r3=22(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 75
LDI r2, 28
LDI r3, 22
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
