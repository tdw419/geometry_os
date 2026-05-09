; DESCRIPTION: Draws a blue line from (64, 3) to (380, 225).
; PLAN: r0=64(x1), r1=3(y1), r2=380(x2), r3=225(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 3
LDI r2, 380
LDI r3, 225
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
