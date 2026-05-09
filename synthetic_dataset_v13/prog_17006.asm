; DESCRIPTION: Draws a blue line from (492, 212) to (7, 134).
; PLAN: r0=492(x1), r1=212(y1), r2=7(x2), r3=134(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 212
LDI r2, 7
LDI r3, 134
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
