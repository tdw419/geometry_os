; DESCRIPTION: Draws a green line from (130, 72) to (355, 10).
; PLAN: r0=130(x1), r1=72(y1), r2=355(x2), r3=10(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 72
LDI r2, 355
LDI r3, 10
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
