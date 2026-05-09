; DESCRIPTION: Draws a blue line from (276, 76) to (187, 144).
; PLAN: r0=276(x1), r1=76(y1), r2=187(x2), r3=144(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 76
LDI r2, 187
LDI r3, 144
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
