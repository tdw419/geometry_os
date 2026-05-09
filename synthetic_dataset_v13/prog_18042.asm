; DESCRIPTION: Draws a blue line from (276, 5) to (436, 150).
; PLAN: r0=276(x1), r1=5(y1), r2=436(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 5
LDI r2, 436
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
