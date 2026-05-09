; DESCRIPTION: Draws a green line from (442, 234) to (355, 4).
; PLAN: r0=442(x1), r1=234(y1), r2=355(x2), r3=4(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 234
LDI r2, 355
LDI r3, 4
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
