; DESCRIPTION: Places a blue line segment connecting (140, 39) to (327, 107).
; PLAN: r0=140(x1), r1=39(y1), r2=327(x2), r3=107(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 39
LDI r2, 327
LDI r3, 107
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
