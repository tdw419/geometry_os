; DESCRIPTION: Draws a blue line from (178, 125) to (74, 107).
; PLAN: r0=178(x1), r1=125(y1), r2=74(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 125
LDI r2, 74
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
