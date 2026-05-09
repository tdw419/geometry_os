; DESCRIPTION: Draws a blue line from (125, 162) to (243, 195).
; PLAN: r0=125(x1), r1=162(y1), r2=243(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 162
LDI r2, 243
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
