; DESCRIPTION: Draws a blue line from (425, 69) to (127, 62).
; PLAN: r0=425(x1), r1=69(y1), r2=127(x2), r3=62(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 69
LDI r2, 127
LDI r3, 62
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
