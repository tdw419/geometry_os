; DESCRIPTION: Draws a blue line from (409, 225) to (294, 6).
; PLAN: r0=409(x1), r1=225(y1), r2=294(x2), r3=6(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 225
LDI r2, 294
LDI r3, 6
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
