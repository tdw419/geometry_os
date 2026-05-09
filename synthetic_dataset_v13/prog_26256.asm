; DESCRIPTION: Draws a yellow line from (275, 65) to (200, 222).
; PLAN: r0=275(x1), r1=65(y1), r2=200(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 65
LDI r2, 200
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
