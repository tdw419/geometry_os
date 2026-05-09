; DESCRIPTION: Draws a blue line from (474, 94) to (82, 187).
; PLAN: r0=474(x1), r1=94(y1), r2=82(x2), r3=187(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 94
LDI r2, 82
LDI r3, 187
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
