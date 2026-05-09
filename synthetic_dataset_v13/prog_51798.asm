; DESCRIPTION: Draws a blue line from (365, 17) to (215, 150).
; PLAN: r0=365(x1), r1=17(y1), r2=215(x2), r3=150(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 17
LDI r2, 215
LDI r3, 150
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
