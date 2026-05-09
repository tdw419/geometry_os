; DESCRIPTION: Places a blue line segment connecting (408, 39) to (74, 65).
; PLAN: r0=408(x1), r1=39(y1), r2=74(x2), r3=65(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 39
LDI r2, 74
LDI r3, 65
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
