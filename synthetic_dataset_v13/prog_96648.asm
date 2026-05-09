; DESCRIPTION: Draws a blue line from (78, 243) to (460, 236).
; PLAN: r0=78(x1), r1=243(y1), r2=460(x2), r3=236(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 243
LDI r2, 460
LDI r3, 236
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
