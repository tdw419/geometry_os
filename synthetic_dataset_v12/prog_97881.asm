; DESCRIPTION: Draws a blue line from (374, 141) to (438, 215).
; PLAN: r0=374(x1), r1=141(y1), r2=438(x2), r3=215(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 141
LDI r2, 438
LDI r3, 215
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
