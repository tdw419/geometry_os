; DESCRIPTION: Draws a blue line from (129, 98) to (122, 164).
; PLAN: r0=129(x1), r1=98(y1), r2=122(x2), r3=164(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 98
LDI r2, 122
LDI r3, 164
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
