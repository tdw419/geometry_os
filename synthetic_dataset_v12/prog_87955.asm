; DESCRIPTION: Draws a black line from (68, 30) to (56, 12).
; PLAN: r0=68(x1), r1=30(y1), r2=56(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 30
LDI r2, 56
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
