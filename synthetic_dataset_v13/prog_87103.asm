; DESCRIPTION: Draws a blue line from (384, 234) to (330, 89).
; PLAN: r0=384(x1), r1=234(y1), r2=330(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 234
LDI r2, 330
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
