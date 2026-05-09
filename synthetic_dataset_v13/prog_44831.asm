; DESCRIPTION: Draws a blue line from (245, 176) to (29, 65).
; PLAN: r0=245(x1), r1=176(y1), r2=29(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 176
LDI r2, 29
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
