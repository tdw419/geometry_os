; DESCRIPTION: Draws a blue line from (79, 125) to (460, 202).
; PLAN: r0=79(x1), r1=125(y1), r2=460(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 125
LDI r2, 460
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
