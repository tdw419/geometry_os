; DESCRIPTION: Draws a yellow line from (462, 234) to (247, 161).
; PLAN: r0=462(x1), r1=234(y1), r2=247(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 234
LDI r2, 247
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
