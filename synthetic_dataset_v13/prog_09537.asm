; DESCRIPTION: Draws a blue line from (245, 91) to (413, 98).
; PLAN: r0=245(x1), r1=91(y1), r2=413(x2), r3=98(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 91
LDI r2, 413
LDI r3, 98
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
