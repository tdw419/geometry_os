; DESCRIPTION: Draws a blue line from (87, 71) to (409, 83).
; PLAN: r0=87(x1), r1=71(y1), r2=409(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 71
LDI r2, 409
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
