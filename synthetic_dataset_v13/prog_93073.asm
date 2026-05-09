; DESCRIPTION: Draws a blue line from (235, 164) to (111, 188).
; PLAN: r0=235(x1), r1=164(y1), r2=111(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 164
LDI r2, 111
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
