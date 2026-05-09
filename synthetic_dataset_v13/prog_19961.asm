; DESCRIPTION: Draws a blue line from (355, 8) to (511, 113).
; PLAN: r0=355(x1), r1=8(y1), r2=511(x2), r3=113(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 8
LDI r2, 511
LDI r3, 113
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
